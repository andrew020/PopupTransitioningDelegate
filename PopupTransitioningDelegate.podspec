#
# Be sure to run `pod lib lint PopupTransitioningDelegate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PopupTransitioningDelegate'
  s.version          = '0.1.0'
  s.summary          = 'A popping animation object likes UIAlertController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A popping animation object likes UIAlertController.
  This object should be created in initailize function of UIViewController.
                       DESC

  s.homepage         = 'https://github.com/andrew020/PopupTransitioningDelegate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrew' => 'andrew2007@foxmail.com' }
  s.source           = { :git => 'https://github.com/andrew020/PopupTransitioningDelegate.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'PopupTransitioningDelegate/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PopupTransitioningDelegate' => ['PopupTransitioningDelegate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
