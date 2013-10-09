Pod::Spec.new do |s|
  s.name         = "DABSquaredDigitalClock"
  s.version      = "1.0.0"
  s.summary      = "A class for making digital style clocks"
  s.homepage     = "https://github.com/DABSquared/DABSquaredDigitalClock"
  s.license      = 'MIT'
  s.author       = { "DABSquared" => "support@dabsquared.com" }
  s.source       = { :git => "https://github.com/DABSquared/DABSquaredDigitalClock.git", :tag => "1.0.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'DigitalClock/DABSquaredDigitalClockView.{h,m}'
  s.requires_arc = true
end
