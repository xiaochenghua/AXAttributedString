Pod::Spec.new do |s|

  s.name         = 'AXAttributedString'
  s.version      = '0.1.5'
  s.summary      = 'An easier NSAttributedString builder, Use Chain-syntax like Masonry.'
  s.homepage     = 'https://github.com/arnoldxiao/AXAttributedString'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { 'xiaochenghua' => 'arnoldxiao@163.com' }
  s.social_media_url   = 'https://weibo.com/arnoldxiao'

  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/arnoldxiao/AXAttributedString.git', :tag => '#{s.version}' }

  s.public_header_files = 'AXAttributedString/Classes/**/*.h'
  s.source_files  = 'AXAttributedString/Classes/**/*'

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit' 
  s.requires_arc = true

  # s.subspec 'Core' do |ss|
  #   ss.public_header_files = 'AXAttributedString/Classes/Core/*.h'
  #   ss.source_files = 'AXAttributedString/Classes/Core/*'
  # end

  # s.subspec 'UI' do |ss|
  #   ss.public_header_files = 'AXAttributedString/Classes/UI/*.h'
  #   ss.source_files = 'AXAttributedString/Classes/UI/*'
  # end

end
