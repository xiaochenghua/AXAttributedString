Pod::Spec.new do |s|

  s.name         = 'AXAttributedString'
  s.version      = '0.1.8'
  s.summary      = 'An easier NSAttributedString builder, Use Chain-syntax like Masonry.'
  s.homepage     = 'https://github.com/arnoldxiao/AXAttributedString'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { 'xiaochenghua' => 'arnoldxiao@163.com' }
  s.social_media_url   = 'https://weibo.com/arnoldxiao'

  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'git@github.com:arnoldxiao/AXAttributedString.git', :tag => '#{s.version}' }

  s.public_header_files = 'AXAttributedString/**/*.h'
  s.source_files  = 'AXAttributedString/**/*'

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit' 
  s.requires_arc = true

  # s.subspec 'Core' do |ss|
  #   ss.public_header_files = 'AXAttributedString/Core/*.h'
  #   ss.source_files = 'AXAttributedString/Core/*'
  # end

  # s.subspec 'UI' do |ss|
  #   ss.public_header_files = 'AXAttributedString/UI/*.h'
  #   ss.source_files = 'AXAttributedString/UI/*'
  # end

end
