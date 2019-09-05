
Pod::Spec.new do |spec|


  spec.name         = "ProjectA"
  spec.version      = "0.0.0"
  spec.summary      = "测试一下哈"
  spec.description  = <<-DESC
                   DESC
  spec.homepage     = "https://github.com/CharlesLuo20140904/ProjectA.git"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "charlesLaw" => "a8717279b@163.com" }
  s.source           = { :git => 'https://github.com/CharlesLuo20140904/ProjectA.git', :tag => s.version.to_s }
  spec.ios.deployment_target = "5.0"
  s.source_files = 'ProjectA/**'

end
