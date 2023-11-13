#
# Be sure to run `pod lib lint TDPresetTemplate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TDPresetTemplate'
  s.version          = '1.0.0'
  s.summary          = 'A short description of TDPresetTemplate.'
  s.homepage         = 'https://github.com/ThinkingDataAnalytics/presettemplate-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License', :file => 'LICENSE' }
  s.author           = { 'ThinkingData, Inc' => 'sdk@thinkingdata.cn' }
  s.source           = { :git => 'https://github.com/ThinkingDataAnalytics/presettemplate-ios-sdk.git', :tag => "v#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TDPresetTemplate/**/*.{h,m}'

  # s.public_header_files = 'Pod/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.dependency 'ThinkingDataCore', '~> 1.0.1'

end
