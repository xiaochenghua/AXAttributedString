Pod::Spec.new do |s|

  s.name                  = "AXAttributedString"
  s.version               = "0.2.2"
  s.summary               = "An easier NSAttributedString builder, Use Chain-syntax like Masonry."
  s.homepage              = "https://github.com/arnoldxiao/AXAttributedString"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "xiaochenghua" => "arnoldxiao@163.com" }
  s.social_media_url      = "https://weibo.com/arnoldxiao"
  s.platform              = :ios
  s.requires_arc          = true
  s.ios.deployment_target = "8.0"
  s.source                = { :git => "https://github.com/arnoldxiao/AXAttributedString.git", :tag => "#{s.version}" }
  s.public_header_files   = "AXAttributedString/Core/*.h","AXAttributedString/UI/*.h"
  s.source_files          = "AXAttributedString/Core/*.{h,m}","AXAttributedString/UI/*.{h,m}"
  s.frameworks            = "Foundation", "CoreGraphics", "UIKit"

end
