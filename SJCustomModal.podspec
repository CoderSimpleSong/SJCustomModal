Pod::Spec.new do |s|  
  s.name         = "SJCustomModal"
  s.version      = "1.0"

  s.summary      = "A Cocoapods Test of SJ"
  s.homepage     = "https://github.com/CoderSimpleSong/SJCustomModal"
  s.license      = "MIT"
  s.author       = { "CoderSimpleSong" => "83694281@qq.com" }
  s.source       = { :git => "https://github.com/CoderSimpleSong/SJCustomModal.git", :tag => s.version }
  
  s.source_files = 'Modal/*.{h,m}'

  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.platform     = :ios, "7.0"
end
