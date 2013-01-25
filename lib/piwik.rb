$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext'
%W{ 
  base data_methods api_module api_response version
  seo referers transitions user_country visit_time visitor_interest visits_summary
  user_settings annotations sites_manager users_manager
  site user annotation actions live pdf_reports image_graph
}.each { |r| require "piwik/#{r}" }

module Piwik
end

class String
  def is_binary_data?
    self.count( "^ -~", "^\r\n" ).fdiv(self.size) > 0.3 || self.index( "\x00" )
  end
end