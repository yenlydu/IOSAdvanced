Pod::Spec.new do |s|
  s.name = 'Detail'
  s.version = '0.1.0'
  s.summary = 'A short description of Detail.'

  s.description = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage = 'https://github.com/yenlydu/Detail'
  s.author = { 'IOSAdvanced' => 'yen-ly.duong@epitech.eu' }
  s.source = { :git => 'https://github.com/yenlydu/Detail.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Detail/Classes/**/*'
  s.dependency 'Core'

end
