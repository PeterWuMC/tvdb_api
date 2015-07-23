Dir[File.join(File.dirname(__FILE__), '*.rb')].reject{|file| file =~ /all\.rb$/}.each do |file|
  require file
end
