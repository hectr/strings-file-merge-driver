Pod::Spec.new do |s|
  s.name             = 'strings-file-merge-driver'
  s.version          = '0.1.0'
  s.summary          = 'A custom git merge driver for strings files.'
  s.homepage         = 'https://github.com/hectr/strings-file-merge-driver'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hèctor Marquès' => 'h@mrhector.me' }
  s.social_media_url = "https://twitter.com/elnetus"
  s.source           = { :http => "#{s.homepage}/releases/download/#{s.version}/strings-file-merge-driver.zip" }
  s.preserve_paths   = '*'
  s.exclude_files    = '**/file.zip'
end
