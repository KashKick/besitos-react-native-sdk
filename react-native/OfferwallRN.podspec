Pod::Spec.new do |s|
  s.name             = 'OfferwallRN'
  s.version          = '1.0.0-beta'
  s.summary          = 'Besitos Offerwall React Native Bridge'
  s.description      = 'React Native bridge for the Besitos Offerwall SDK. Calls the native iOS SDK directly with no extra dependencies.'
  s.homepage         = 'https://github.com/KashKick/besitos-react-native-sdk'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'KashKick' => 'shraddha@kashkick.com' }
  s.source           = { :git => 'https://github.com/KashKick/besitos-react-native-sdk.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.9'
  s.source_files     = 'ios/*.{swift,m,h}'
  s.dependency 'React-Core'
  s.dependency 'Offerwall', '~> 1.0.0'
end
