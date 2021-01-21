Pod::Spec.new do |s|
  s.name             = 'YellowMessenger'
  s.version          = '0.1.0'
  s.summary          = 'YellowMessenger SDK for iOS.'
  s.description      = 'YellowMessenger SDK for iOS'
  s.homepage         = 'https://github.com/yellowmessenger/webview-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yellowmessenger' => 'yellowmessenger@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/yellowmessenger/webview-sdk-ios', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'

  s.source_files = 'YellowMessenger/Classes/**/*'
  
  s.resource_bundles = {
    'YellowMessenger' => ['YellowMessenger/**/*.xcassets']
  }
  s.swift_version = "5.0"
end
