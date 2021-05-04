Pod::Spec.new do |s|
  s.name = 'Core'
  s.version = '0.1.0'
  s.summary = 'A short description of Core.'

  s.description = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage = 'https://github.com/yenlydu/Core'
  s.author = { 'IOSAdvanced' => 'yen-ly.duong@epitech.eu' }
  s.source = { :git => 'https://github.com/yenlydu/Core.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Core/Classes/**/*'
end
