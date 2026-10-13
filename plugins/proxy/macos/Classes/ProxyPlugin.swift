import Cocoa
import FlutterMacOS
import Security
import SystemConfiguration

public class ProxyPlugin: NSObject, FlutterPlugin {
    private var authorization: AuthorizationRef?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "proxy", binaryMessenger: registrar.messenger)
        registrar.addMethodCallDelegate(ProxyPlugin(), channel: channel)
    }

    deinit {
        if let authorization = authorization { AuthorizationFree(authorization, []) }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            switch call.method {
            case "StartProxy":
                guard let args = call.arguments as? [String: Any],
                      let port = args["port"] as? Int, (1...65535).contains(port),
                      let bypass = args["bypassDomain"] as? [String] else {
                    result(FlutterError(code: "bad_args", message: "Invalid proxy arguments", details: nil))
                    return
                }
                try start(port: port, bypass: bypass)
                result(true)
            case "StopProxy":
                try restore()
                result(true)
            default:
                result(FlutterMethodNotImplemented)
            }
        } catch {
            if call.method == "StartProxy" { try? restore() }
            result(FlutterError(code: "proxy_recovery_failed", message: "Cannot safely apply or restore system proxy settings", details: nil))
        }
    }

    private enum RecoveryError: Error { case unavailable, invalidRecord }

    private func preferences() throws -> SCPreferences {
        if authorization == nil {
            guard AuthorizationCreate(nil, nil, [], &authorization) == errAuthorizationSuccess else {
                throw RecoveryError.unavailable
            }
        }
        guard let prefs = SCPreferencesCreateWithAuthorization(nil, "FastAI Proxy" as CFString, nil, authorization),
              SCPreferencesLock(prefs, true) else { throw RecoveryError.unavailable }
        return prefs
    }

    private func journalURL() throws -> URL {
        let manager = FileManager.default
        let base = try manager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let directory = base.appendingPathComponent("ws.fastdog.fastai/ProxyRecovery", isDirectory: true)
        try manager.createDirectory(at: directory, withIntermediateDirectories: true,
                                    attributes: [.posixPermissions: 0o700])
        let attributes = try manager.attributesOfItem(atPath: directory.path)
        guard attributes[.type] as? FileAttributeType == .typeDirectory else { throw RecoveryError.invalidRecord }
        try manager.setAttributes([.posixPermissions: 0o700], ofItemAtPath: directory.path)
        return directory.appendingPathComponent("system-proxy.plist")
    }

    private func load(_ url: URL) throws -> [String: [String: Any]] {
        guard FileManager.default.fileExists(atPath: url.path) else { return [:] }
        let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
        guard attributes[.type] as? FileAttributeType == .typeRegular,
              ((attributes[.size] as? NSNumber)?.intValue ?? Int.max) <= 1024 * 1024 else {
            throw RecoveryError.invalidRecord
        }
        let data = try Data(contentsOf: url)
        guard let records = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: [String: Any]] else {
            throw RecoveryError.invalidRecord
        }
        return records
    }

    private func save(_ records: [String: [String: Any]], to url: URL) throws {
        let data = try PropertyListSerialization.data(fromPropertyList: records, format: .binary, options: 0)
        guard data.count <= 1024 * 1024 else { throw RecoveryError.invalidRecord }
        try data.write(to: url, options: .atomic)
        try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
        let handle = try FileHandle(forWritingTo: url)
        defer { try? handle.close() }
        try handle.synchronize()
    }

    private func commit(_ prefs: SCPreferences) throws {
        guard SCPreferencesCommitChanges(prefs), SCPreferencesApplyChanges(prefs) else {
            throw RecoveryError.unavailable
        }
    }

    private func restore() throws {
        let url = try journalURL()
        let records = try load(url)
        guard !records.isEmpty else { return }
        let prefs = try preferences()
        defer { SCPreferencesUnlock(prefs) }
        var remaining = records
        var changed = false
        for (id, record) in records {
            guard let original = record["original"] as? [String: Any],
                  let applied = record["applied"] as? [String: Any],
                  let hadConfiguration = record["hadConfiguration"] as? Bool else {
                throw RecoveryError.invalidRecord
            }
            guard let service = SCNetworkServiceCopy(prefs, id as CFString),
                  let proxies = SCNetworkServiceCopyProtocol(service, kSCNetworkProtocolTypeProxies) else { continue }
            let current = SCNetworkProtocolGetConfiguration(proxies) as? [String: Any] ?? [:]
            if NSDictionary(dictionary: current).isEqual(to: applied) ||
               NSDictionary(dictionary: current).isEqual(to: original) {
                guard SCNetworkProtocolSetConfiguration(proxies, hadConfiguration ? original as CFDictionary : nil) else {
                    throw RecoveryError.unavailable
                }
                changed = true
            }
            remaining.removeValue(forKey: id)
        }
        if changed { try commit(prefs) }
        if remaining.isEmpty {
            try FileManager.default.removeItem(at: url)
        } else {
            try save(remaining, to: url)
            throw RecoveryError.unavailable
        }
    }

    private func start(port: Int, bypass: [String]) throws {
        try restore()
        let url = try journalURL()
        let prefs = try preferences()
        defer { SCPreferencesUnlock(prefs) }
        guard let set = SCNetworkSetCopyCurrent(prefs),
              let services = SCNetworkSetCopyServices(set) as? [SCNetworkService] else {
            throw RecoveryError.unavailable
        }
        var records: [String: [String: Any]] = [:]
        for service in services where SCNetworkServiceGetEnabled(service) {
            guard let proxies = SCNetworkServiceCopyProtocol(service, kSCNetworkProtocolTypeProxies) else { continue }
            let configuration = SCNetworkProtocolGetConfiguration(proxies)
            let original = configuration as? [String: Any] ?? [:]
            var applied = original
            for name in ["HTTP", "HTTPS", "SOCKS"] {
                applied[name + "Enable"] = 1
                applied[name + "Proxy"] = "127.0.0.1"
                applied[name + "Port"] = port
                applied[name + "User"] = nil
            }
            applied[kSCPropNetProxiesExceptionsList as String] = bypass
            applied[kSCPropNetProxiesProxyAutoConfigEnable as String] = 0
            applied[kSCPropNetProxiesProxyAutoDiscoveryEnable as String] = 0
            guard let serviceID = SCNetworkServiceGetServiceID(service) else { throw RecoveryError.unavailable }
            let id = serviceID as String
            records[id] = ["original": original, "applied": applied, "hadConfiguration": configuration != nil]
            guard SCNetworkProtocolSetConfiguration(proxies, applied as CFDictionary) else { throw RecoveryError.unavailable }
        }
        guard !records.isEmpty else { throw RecoveryError.unavailable }
        try save(records, to: url)
        try commit(prefs)
    }
}
