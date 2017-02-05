Pod::Spec.new do |s|
  s.name             = 'CascadePresenter'
  s.version          = '1.0.0'
  s.summary          = 'Cascade animation for presentation and dismission view controllers'

  s.description      = <<-DESC
This library provides instances of UIViewControllerAnimatedTransitioning for animating presentig and dismissing view controller.
                       DESC

  s.homepage         = 'https://github.com/NickKibish/CascadePresenter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'git' => 'nick.kibish@gmail.com' }
  s.source           = { :git => 'https://github.com/NickKibish/CascadePresenter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'CascadePresenter/Classes/**/*'
end
