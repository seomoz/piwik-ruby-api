$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext'
%W{ 
  base api_module api_response version 
  seo referers transitions user_country
  site user
}.each { |r| require "piwik/#{r}" }

module Piwik
end