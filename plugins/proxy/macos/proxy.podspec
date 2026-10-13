Pod::Spec.new do |s|
  s.name = 'proxy'
  s.version = '0.0.1'
  s.summary = 'FastAI system proxy integration.'
  s.description = 'Restores owned system proxy settings using SystemConfiguration.'
  s.homepage = 'https://github.com/lenaanderson5566-ops/FlClash'
  s.license = { :file => '../LICENSE' }
  s.author = { 'FastAI' => 'FastAI' }
  s.source = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '12.0'
  s.swift_version = '5.0'
  s.frameworks = 'SystemConfiguration', 'Security'
end
