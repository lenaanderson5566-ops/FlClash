import 'dart:convert';

String browserLoginPage({
  required bool valid,
  required String message,
  required String nonce,
}) {
  const escape = HtmlEscape();
  final chinese = RegExp(r'[\u4e00-\u9fff]').hasMatch(message);
  final title = valid
      ? (chinese ? '授权已送达' : 'Authorization received')
      : (chinese ? '此授权已失效' : 'Authorization unavailable');
  final detail = valid
      ? (chinese
            ? '请返回 FastAI，客户端将继续完成登录。确认登录完成后，即可关闭此页面。'
            : 'Return to FastAI to finish signing in. You can close this tab once the app confirms your login.')
      : (chinese
            ? '请回到 FastAI 重新发起登录。此页面不会更改你的账号。'
            : 'Return to FastAI and start a new sign-in request. Your account has not been changed.');
  return '''<!doctype html><html lang="${chinese ? 'zh-CN' : 'en'}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>${escape.convert(title)} · FastAI</title>
<style> :root{color-scheme:light dark;--bg:#f4f7fb;--card:#fff;--ink:#172b46;--muted:#68788b;--line:#e1e8f1;--brand:#153b70;--soft:#e8eff8}*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font:16px/1.7 system-ui,-apple-system,"Segoe UI",sans-serif;min-height:100svh;display:grid;place-items:center;padding:28px}main{width:min(100%,480px)}header{display:flex;align-items:center;gap:12px;font-weight:750;margin-bottom:24px;letter-spacing:.03em}.brand{background:var(--brand);color:#fff;width:38px;height:38px;display:grid;place-items:center;border-radius:12px}article{background:var(--card);border:1px solid var(--line);border-radius:28px;padding:36px;box-shadow:0 20px 60px #153b7009}.status{width:60px;height:60px;background:var(--soft);color:var(--brand);display:grid;place-items:center;border-radius:20px;font-size:28px}h1{font-size:27px;letter-spacing:-.03em;margin:24px 0 12px}p{color:var(--muted);margin:0}.next{margin-top:26px;padding:16px;background:var(--soft);border-radius:14px;color:var(--ink);font-size:14px}footer{font-size:12px;color:var(--muted);margin-top:20px;text-align:center}@media(prefers-color-scheme:dark){:root{--bg:#101720;--card:#182330;--ink:#edf3fa;--muted:#a5b4c5;--line:#2b3b4f;--brand:#94bdf5;--soft:#243851}.brand{color:#15283f}}@media(max-width:420px){article{padding:26px}h1{font-size:24px}}</style></head><body><main><header><span class="brand" aria-hidden="true">F</span>FastAI</header><article><div class="status" aria-hidden="true">${valid ? '✓' : '!'}</div><h1>${escape.convert(title)}</h1><p>${escape.convert(detail)}</p><div class="next">${chinese ? '下一步：切换回 FastAI 客户端' : 'Next: switch back to FastAI'}</div></article><footer>FastDog · ${chinese ? '提供技术支持' : 'Technical support'}</footer></main><script nonce="$nonce">history.replaceState(null,'',location.pathname);</script></body></html>''';
}
