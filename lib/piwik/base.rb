require 'rubygems'
require 'cgi'
require 'yaml'
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
    # This is required to normalize the API responses when the Rails XmlSimple version is used
    def self.parse_xml xml
      result = XmlSimple.xml_in(xml, {'ForceArray' => false})
      result = result['result'] if result['result']
      result
    end
    def parse_xml xml; self.class.parse_xml xml; end
  

    # Calls the supplied Piwik API method, with the supplied parameters.
    # 
    # Returns a string containing the XML reply from Piwik, or raises a 
    # <tt>Piwik::ApiError</tt> exception with the error message returned by Piwik 
    # in case it receives an error.
    def call(method, params={})
      self.class.call(method, params, config[:piwik_url], config[:auth_token])
    end
    
    class << self
      # Calls the supplied Piwik API method, with the supplied parameters.
      # 
      # Returns a string containing the XML reply from Piwik, or raises a 
      # <tt>Piwik::ApiError</tt> exception with the error message returned by Piwik 
      # in case it receives an error.
      def call(method, params={}, piwik_url=nil, auth_token=nil)
        raise MissingConfiguration, "Please edit ~/.piwik to include your piwik url and auth_key" if piwik_url.nil? || auth_token.nil?
        url = "#{piwik_url}/?module=API&format=xml&method=#{method}"
        url << "&token_auth=#{auth_token}" unless auth_token.nil?
        params.each { |k, v| url << "&#{k}=#{CGI.escape(v.to_s)}" }
        verbose_obj_save = $VERBOSE
        $VERBOSE = nil # Suppress "warning: peer certificate won't be verified in this SSL session"
        puts url
        xml = RestClient.get(url)
        $VERBOSE = verbose_obj_save
        if xml =~ /error message=/
          result = XmlSimple.xml_in(xml, {'ForceArray' => false})
          raise ApiError, result['error']['message'] if result['error']
        end
        xml
      end
      
      # Checks for the config, creates it if not found
      def load_config_from_file
        # Useful for testing or embedding credentials - although as always 
        # it is not recommended to embed any kind of credentials in source code for security reasons
        return { :piwik_url => PIWIK_URL, :auth_token => PIWIK_TOKEN } if PIWIK_URL.present? and PIWIK_TOKEN.present?
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
end

