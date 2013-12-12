Pod::Spec.new do |s|
  s.name = "LFilterView"
  s.version = "1.0.0"
  s.summary = "In many projects there are requirements for some kind of check or radio lists. In order to simplify the process I’ve created a control that allows easy creation of different check and radio list components."
  s.homepage = "https://github.com/lukagabric/LFilterView"
  s.license = { :type => 'MIT', :file => 'LICENSE'}
  s.author = { "lukagabric" => "luka.gabric@gmail.com" }
  s.source = {
      :git => "https://github.com/lukagabric/LFilterView.git",
      :tag => s.version.to_s
    }
        
  s.ios.deployment_target = '5.0'
    
  s.default_subspec = 'core'

  s.subspec 'core' do |c|
    c.requires_arc = true
    c.source_files = 'LFilterView/Classes/*', 'LFilterView/Supporting Files/*'
    c.resources = 'LFilterView/Resources/*'
  end
  
  s.subspec 'demo' do |d|
    d.requires_arc = true
    d.source_files = 'LFilterViewSample/Classes/*', 'LFilterViewSample/Supporting Files/*'
    d.preserve_paths = "LFilterView.xcodeproj"
    d.dependency 'DKNavbarBackButton/core'
  end

end