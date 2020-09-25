#
# Be sure to run `pod lib lint AXAttributedString.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = "AXAttributedString"
  s.version          = "0.2.5"
  s.summary          = "An easier attribute text creator, use chain-syntax."
  s.homepage         = "https://github.com/arnoldxiao/AXAttributedString"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "arnoldxiao" => "arnoldxiao@163.com" }
  s.social_media_url = "https://weibo.com/arnoldxiao"

  s.platform              = :ios
  s.requires_arc          = true
  s.ios.deployment_target = "8.0"
  s.source                = { :git => "https://github.com/arnoldxiao/AXAttributedString.git", :tag => "#{s.version}" }

  s.subspec 'Core' do |c|
    c.public_header_files = "AXAttributedString/Core/*.h"
    c.source_files = "AXAttributedString/Core/*.{h,m}"
    c.frameworks = "Foundation", "CoreGraphics"
  end

  s.subspec 'UIKit' do |u|
    u.public_header_files = "AXAttributedString/UI/*.h"
    u.source_files = "AXAttributedString/UI/*.{h,m}"
    u.frameworks = "UIKit"
    u.dependency "AXAttributedString/Core"
  end

  # s.frameworks            = "Foundation", "CoreGraphics", "UIKit"

end
