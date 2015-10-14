Pod::Spec.new do |s|
  s.name         = "UIKitSwagger"
  s.version      = "0.7.0"
  s.summary      = "Simpler UIKit development in Swift"
  s.homepage     = "https://github.com/samodom/UIKitSwagger"
  s.license      = "MIT"
  s.author       = { "Sam Odom" => "samodom@icloud.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/samodom/UIKitSwagger.git", :tag => "v0.7.0" }
  s.source_files = "UIKitSwagger/**/*.{h,swift}"
  s.requires_arc = true
end
