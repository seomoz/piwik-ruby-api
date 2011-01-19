$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'piwik/base.rb'
require 'piwik/site.rb'
require 'piwik/user.rb'
require 'piwik/trackable.rb'
module Piwik
  VERSION = "0.4.3"
end
