#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint firebase_installations.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'firebase_installations'
  s.version          = '16.3.5'
  s.summary          = 'Firebase installations Flutter plugin.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://fabio.cigliano.name'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Fabio Cigliano' => 'fabio.cigliano@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  s.dependency 'Firebase/Installations'
end