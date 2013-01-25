$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext'
%W{ 
  base data_methods api_module api_response version
  seo referers transitions user_country visit_time visitor_interest visits_summary
  user_settings annotations sites_manager users_manager
  site user annotation actions
}.each { |r| require "piwik/#{r}" }

module Piwik
end