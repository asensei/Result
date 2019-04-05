Pod::Spec.new do |spec|
  spec.name         = 'ResultCocoapods'
  spec.version      = '1.2.0'
  spec.swift_version = '5.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/asensei/Result'
  spec.authors      = { 'Asensei' => 'info@asensei.com' }
  spec.summary      = 'Swift type modelling the success/failure of arbitrary operations.'
  spec.source       = { :git => "https://github.com/asensei/Result.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.11"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.requires_arc = true
  spec.source_files = "Sources/**/*.{swift}"
  spec.framework = 'Foundation'
end
