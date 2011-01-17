require 'rubygems'
require 'cgi'
require 'active_support'
require 'rest_client'
require 'xmlsimple'

module Piwik
  class ApiError < StandardError; end
  class MissingConfiguration < ArgumentError; end
  class UnknownSite < ArgumentError; end
  class UnknownUser < ArgumentError; end

  class Base
    @@template  = <<-EOF
# .piwik
# 
# Please fill in fields like this:
#
#  piwik_url: http://your.piwik.site
#  auth_token: secret
#
piwik_url: 
auth_token: 
EOF
      
    private
      # Checks for the config, creates it if not found
      def self.load_config_from_file
        config = {}
        if defined?(RAILS_ROOT) and RAILS_ROOT != nil
          home =  RAILS_ROOT
          filename = "config/piwik.yml"
        else
          home =  ENV['HOME'] || ENV['USERPROFILE'] || ENV['HOMEPATH'] || "."
          filename = ".piwik"
        end
        temp_config = if File.exists?(File.join(home,filename))
          YAML::load(open(File.join(home,filename)))
        else
          open(File.join(home,filename),'w') { |f| f.puts @@template }
          YAML::load(@@template)
        end
        temp_config.each { |k,v| config[k.to_sym] = v } if temp_config
        if config[:piwik_url] == nil || config[:auth_token] == nil
          if defined?(RAILS_ROOT) and RAILS_ROOT != nil
            raise MissingConfiguration, "Please edit ./config/piwik.yml to include your piwik url and auth_key"
          else
            raise MissingConfiguration, "Please edit ~/.piwik to include your piwik url and auth_key"
          end
          
        end
        config
      end
  end
end
