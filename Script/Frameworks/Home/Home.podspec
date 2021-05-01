Pod::Spec.new do |s|
  s.name = 'Home'
  s.version = '0.1.0'
  s.summary = 'A short description of Home.'

  s.description = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage = 'https://github.com/yenlydu/Home'
  s.author = { 'IOSAdvanced' => 'yen-ly.duong@epitech.eu' }
  s.source = { :git => 'https://github.com/yenlydu/Home.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Home/Classes/**/*'
  s.dependency 'Core'
end
