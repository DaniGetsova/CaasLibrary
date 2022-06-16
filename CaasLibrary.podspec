#
# Be sure to run `pod lib lint CaasLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CaasLibrary'
  s.version          = '0.1.0'
  s.summary          = 'A short meaningfull description of CaasLibrary.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A short meaningfull description of CaasLibrary. A short meaningfull description of CaasLibrary.'

  s.homepage         = 'https://github.com/DaniGetsova/CaasLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DaniGetsova' => 'yordanka.getsova@abv.bg' }
  s.source           = { :git => 'https://github.com/DaniGetsova/CaasLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'CaasLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CaasLibrary' => ['CaasLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'SwiftyJSON', '~> 4.0'
  s.dependency 'Alamofire', '~> 5.2'
  
  # s.dependency 'RappleProgressHUD'
  # s.dependency 'KeychainSwift', '~> 19.0'
  # s.dependency 'CryptoSwift', '~> 1.3.8'
  # s.dependency 'SwiftOTP'
end
