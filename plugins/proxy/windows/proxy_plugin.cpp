#include "proxy_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <WinInet.h>
#include <algorithm>
#include <string>
#include <vector>

#pragma comment(lib, "wininet")
#pragma comment(lib, "advapi32")

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>

namespace
{

constexpr int kMinProxyPort = 1;
constexpr int kMaxProxyPort = 65535;

std::wstring Utf8ToWide(const std::string& value)
{
  if (value.empty())
  {
    return {};
  }
  const int size = MultiByteToWideChar(
      CP_UTF8, 0, value.c_str(), static_cast<int>(value.size()), nullptr, 0);
  if (size <= 0)
  {
    return std::wstring(value.begin(), value.end());
  }
  std::wstring result(size, L'\0');
  MultiByteToWideChar(
      CP_UTF8, 0, value.c_str(), static_cast<int>(value.size()),
      result.data(), size);
  return result;
}

std::wstring BuildBypassList(const flutter::EncodableList& bypassDomain)
{
  std::wstring bypassList;
  for (const auto& domain : bypassDomain)
  {
    const auto& value = std::get<std::string>(domain);
    if (!bypassList.empty())
    {
      bypassList += L";";
    }
    bypassList += Utf8ToWide(value);
  }
  return bypassList;
}

bool IsStringList(const flutter::EncodableList& values)
{
  return std::all_of(
      values.begin(), values.end(), [](const auto& value)
      {
        const auto* text = std::get_if<std::string>(&value);
        return text != nullptr && text->find('\0') == std::string::npos;
      });
}


struct ProxySettings {
  DWORD flags = 0;
  std::wstring server;
  std::wstring bypass;
  std::wstring pac;
};

constexpr wchar_t kRecoveryKey[] = L"Software\\FastAI\\ProxyRecovery";
constexpr wchar_t kRecoveryValue[] = L"LAN.v1";

bool ReadSettings(ProxySettings& settings)
{
  INTERNET_PER_CONN_OPTIONW options[4] = {};
  options[0].dwOption = INTERNET_PER_CONN_FLAGS_UI;
  options[1].dwOption = INTERNET_PER_CONN_PROXY_SERVER;
  options[2].dwOption = INTERNET_PER_CONN_PROXY_BYPASS;
  options[3].dwOption = INTERNET_PER_CONN_AUTOCONFIG_URL;
  INTERNET_PER_CONN_OPTION_LISTW list = {};
  list.dwSize = sizeof(list);
  list.dwOptionCount = 4;
  list.pOptions = options;
  DWORD size = sizeof(list);
  const bool success = InternetQueryOptionW(
      nullptr, INTERNET_OPTION_PER_CONNECTION_OPTION, &list, &size) != FALSE;
  if (success) {
    settings.flags = options[0].Value.dwValue;
    settings.server = options[1].Value.pszValue ? options[1].Value.pszValue : L"";
    settings.bypass = options[2].Value.pszValue ? options[2].Value.pszValue : L"";
    settings.pac = options[3].Value.pszValue ? options[3].Value.pszValue : L"";
  }
  for (int i = 1; i < 4; ++i) {
    if (options[i].Value.pszValue) GlobalFree(options[i].Value.pszValue);
  }
  return success;
}

bool SameSettings(const ProxySettings& left, const ProxySettings& right)
{
  return left.flags == right.flags && left.server == right.server &&
         left.bypass == right.bypass && left.pac == right.pac;
}

bool WriteSettings(ProxySettings settings)
{
  INTERNET_PER_CONN_OPTIONW options[4] = {};
  options[0].dwOption = INTERNET_PER_CONN_FLAGS;
  options[0].Value.dwValue = settings.flags;
  options[1].dwOption = INTERNET_PER_CONN_PROXY_SERVER;
  options[1].Value.pszValue = settings.server.data();
  options[2].dwOption = INTERNET_PER_CONN_PROXY_BYPASS;
  options[2].Value.pszValue = settings.bypass.data();
  options[3].dwOption = INTERNET_PER_CONN_AUTOCONFIG_URL;
  options[3].Value.pszValue = settings.pac.data();
  INTERNET_PER_CONN_OPTION_LISTW list = {};
  list.dwSize = sizeof(list);
  list.dwOptionCount = 4;
  list.pOptions = options;
  const bool applied = InternetSetOptionW(
      nullptr, INTERNET_OPTION_PER_CONNECTION_OPTION, &list, sizeof(list)) != FALSE;
  const bool changed = InternetSetOptionW(
      nullptr, INTERNET_OPTION_SETTINGS_CHANGED, nullptr, 0) != FALSE;
  const bool refreshed = InternetSetOptionW(
      nullptr, INTERNET_OPTION_REFRESH, nullptr, 0) != FALSE;
  return applied && changed && refreshed;
}

void AppendSettings(std::vector<wchar_t>& data, const ProxySettings& settings)
{
  for (const auto& value : {std::to_wstring(settings.flags), settings.server,
                            settings.bypass, settings.pac}) {
    data.insert(data.end(), value.begin(), value.end());
    data.push_back(L'\0');
  }
}

bool ParseSettings(const std::vector<wchar_t>& data, size_t& offset,
                   ProxySettings& settings)
{
  std::wstring values[4];
  for (auto& value : values) {
    auto end = std::find(data.begin() + offset, data.end(), L'\0');
    if (end == data.end()) return false;
    value.assign(data.begin() + offset, end);
    offset = static_cast<size_t>(end - data.begin()) + 1;
  }
  if (values[0].empty() || values[0].size() > 2 ||
      values[0].find_first_not_of(L"0123456789") != std::wstring::npos) return false;
  settings.flags = static_cast<DWORD>(std::stoul(values[0]));
  if (settings.flags > 15) return false;
  settings.server = values[1];
  settings.bypass = values[2];
  settings.pac = values[3];
  return true;
}

bool SaveRecovery(const ProxySettings& original, const ProxySettings& applied)
{
  std::vector<wchar_t> data;
  AppendSettings(data, original);
  AppendSettings(data, applied);
  if (data.size() * sizeof(wchar_t) > 1024 * 1024 || original.flags > 15) return false;
  HKEY key = nullptr;
  if (RegCreateKeyExW(HKEY_CURRENT_USER, kRecoveryKey, 0, nullptr, 0,
                     KEY_SET_VALUE, nullptr, &key, nullptr) != ERROR_SUCCESS) return false;
  const auto result = RegSetValueExW(key, kRecoveryValue, 0, REG_BINARY,
      reinterpret_cast<const BYTE*>(data.data()),
      static_cast<DWORD>(data.size() * sizeof(wchar_t)));
  const auto flushed = result == ERROR_SUCCESS ? RegFlushKey(key) : result;
  RegCloseKey(key);
  return result == ERROR_SUCCESS && flushed == ERROR_SUCCESS;
}

bool stopProxy()
{
  HKEY key = nullptr;
  auto result = RegOpenKeyExW(HKEY_CURRENT_USER, kRecoveryKey, 0,
                             KEY_QUERY_VALUE | KEY_SET_VALUE, &key);
  if (result == ERROR_FILE_NOT_FOUND) return true;
  if (result != ERROR_SUCCESS) return false;
  DWORD bytes = 0;
  DWORD type = 0;
  result = RegQueryValueExW(key, kRecoveryValue, nullptr, &type, nullptr, &bytes);
  if (result == ERROR_FILE_NOT_FOUND) { RegCloseKey(key); return true; }
  if (result != ERROR_SUCCESS || type != REG_BINARY || bytes == 0 ||
      bytes > 1024 * 1024 || bytes % sizeof(wchar_t) != 0) {
    RegCloseKey(key); return false;
  }
  std::vector<wchar_t> data(bytes / sizeof(wchar_t));
  result = RegQueryValueExW(key, kRecoveryValue, nullptr, &type,
                           reinterpret_cast<BYTE*>(data.data()), &bytes);
  ProxySettings original, applied, current;
  size_t offset = 0;
  if (result != ERROR_SUCCESS || !ParseSettings(data, offset, original) ||
      !ParseSettings(data, offset, applied) || offset != data.size() || !ReadSettings(current)) {
    RegCloseKey(key); return false;
  }
  // A partial write is recoverable; a value outside both snapshots belongs to someone else.
  const bool owned =
      (current.flags == original.flags || current.flags == applied.flags) &&
      (current.server == original.server || current.server == applied.server) &&
      (current.bypass == original.bypass || current.bypass == applied.bypass) &&
      (current.pac == original.pac || current.pac == applied.pac);
  if (owned) {
    ProxySettings restored;
    if (!WriteSettings(original) || !ReadSettings(restored) || !SameSettings(restored, original)) {
      RegCloseKey(key); return false;
    }
  }
  result = RegDeleteValueW(key, kRecoveryValue);
  RegCloseKey(key);
  return result == ERROR_SUCCESS || result == ERROR_FILE_NOT_FOUND;
}

bool startProxy(const int port, const flutter::EncodableList& bypassDomain)
{
  if (!stopProxy()) return false;
  ProxySettings original;
  if (!ReadSettings(original)) return false;
  auto applied = original;
  applied.flags = PROXY_TYPE_DIRECT | PROXY_TYPE_PROXY;
  applied.server = Utf8ToWide("127.0.0.1:" + std::to_string(port));
  applied.bypass = BuildBypassList(bypassDomain);
  if (!SaveRecovery(original, applied)) return false;
  ProxySettings current;
  if (WriteSettings(applied) && ReadSettings(current) && SameSettings(current, applied)) return true;
  stopProxy();
  return false;
}

}  // namespace

namespace proxy
{

  // static
  void ProxyPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "proxy",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<ProxyPlugin>(registrar);

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  ProxyPlugin::ProxyPlugin(flutter::PluginRegistrarWindows* registrar)
      : registrar_(registrar)
  {
    window_proc_id_ = registrar_->RegisterTopLevelWindowProcDelegate(
        [this](HWND window, UINT message, WPARAM wparam, LPARAM lparam)
        {
          return HandleWindowProc(window, message, wparam, lparam);
        });
  }

  ProxyPlugin::~ProxyPlugin()
  {
    if (registrar_ != nullptr)
    {
      registrar_->UnregisterTopLevelWindowProcDelegate(window_proc_id_);
    }
  }

  bool ProxyPlugin::IsSessionEnding(UINT message, WPARAM wparam)
  {
    return message == WM_ENDSESSION && wparam != FALSE;
  }

  // Shutting Windows down kills the process without running the Dart exit path,
  // so the setting survives into a boot with nothing listening behind it.
  std::optional<LRESULT> ProxyPlugin::HandleWindowProc(
      HWND, UINT message, WPARAM wparam, LPARAM)
  {
    if (proxy_applied_ && IsSessionEnding(message, wparam))
    {
      proxy_applied_ = !stopProxy();
    }
    return std::nullopt;
  }

  void ProxyPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    if (method_call.method_name() == "StopProxy")
    {
      const bool stopped = stopProxy();
      proxy_applied_ = proxy_applied_ && !stopped;
      result->Success(stopped);
    }
    else if (method_call.method_name() == "StartProxy")
    {
      auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      if (arguments == nullptr)
      {
        result->Error("bad_args", "StartProxy requires argument map");
        return;
      }
      auto portIt = arguments->find(flutter::EncodableValue("port"));
      auto bypassDomainIt = arguments->find(flutter::EncodableValue("bypassDomain"));
      if (portIt == arguments->end() || bypassDomainIt == arguments->end())
      {
        result->Error("bad_args", "StartProxy requires port and bypassDomain");
        return;
      }
      auto *port = std::get_if<int>(&portIt->second);
      auto *bypassDomain = std::get_if<flutter::EncodableList>(&bypassDomainIt->second);
      if (port == nullptr || bypassDomain == nullptr)
      {
        result->Error("bad_args", "StartProxy argument types are invalid");
        return;
      }
      if (*port < kMinProxyPort || *port > kMaxProxyPort)
      {
        result->Error("bad_args", "StartProxy port must be between 1 and 65535");
        return;
      }
      if (!IsStringList(*bypassDomain))
      {
        result->Error(
            "bad_args", "StartProxy bypassDomain must contain only strings");
        return;
      }
      // A start that reports failure can still have written the setting.
      proxy_applied_ = true;
      result->Success(startProxy(*port, *bypassDomain));
    }
    else
    {
      result->NotImplemented();
    }
  }
} // namespace proxy
