Pod::Spec.new do |s|
  s.name             = 'Offerwall'
  s.version          = '1.0.0'
  s.summary          = 'Besitos Offerwall Mobile SDK for iOS'
  s.description      = 'Plug-and-play Offerwall WebView SDK for iOS. Embed the Besitos Offerwall inside any native iOS app with minimal code.'
  s.homepage         = 'https://github.com/KashKick/besitos-react-native-sdk'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'KashKick' => 'shraddha@kashkick.com' }
  s.source           = { :git => 'https://github.com/KashKick/besitos-react-native-sdk.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.9'
  s.source_files     = 'Sources/Offerwall/**/*.swift'
  s.resource_bundles = { 'Offerwall' => ['Sources/Offerwall/PrivacyInfo.xcprivacy'] }
end
