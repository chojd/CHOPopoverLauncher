#
# Be sure to run `pod lib lint CHOPopoverLauncher.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CHOPopoverLauncher'
  s.version          = '0.1.0'
  s.summary          = 'Popover Launch'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
      Popover Launcher 对 popover 对队列管理
  DESC
  
  s.homepage = 'http://git.CHOashion.com.cn/ios-CHCHOramework/com-CHOashion-popover_launcher'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.author   = { 'chojd' => 'i@chojd.com' }
  s.source    = { :git => 'git@git.CHOashion.com.cn:ios-CHCHOramework/com-CHOashion-popover_launcher.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'
  
  s.subspec 'Launcher' do |ss|
    ss.source_files = 'Sources/Launcher/*'
    
    ss.subspec 'Internal' do |sss|
      sss.source_files = 'Sources/Launcher/Internal/*'
    end
    
    ss.dependency 'CHOPopoverLauncher/Popover'
  end
  
  s.subspec 'Popover' do |ss|
    ss.source_files = 'Sources/Popover/*'
  end
  
  s.frameworks = 'UIKit'
  
end
