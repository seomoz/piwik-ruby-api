$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext'
Dir[File.join(File.dirname(__FILE__),'piwik','*.rb')].each { |r| require r }

module Piwik
  # Your code goes here...
end