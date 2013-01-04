module Piwik
  class ApiModule < Base
    include Piwik::DataMethods
    
    # Catch incoming method calls and try to format them and send them over to the api
    def self.method_missing(method, *args, &block)
      formatted_method = method.to_s.camelize(:lower)
      formatted_method = formatted_method.gsub(/ip$/i,'IP').gsub(/os/i,'OS') # Lame
      # connect to API if this is a valid-looking method in the current class context
      if self::AVAILABLE_METHODS.include?(formatted_method)
        handle_api_call(formatted_method, args.first)
      else
        super
      end
    end
    
    # This is a method
    def self.api_call_to_const string, full = false
      # We can get rid of the get prefix
      string = string.gsub('get', '').gsub('.', '::').camelize
      full ? "Piwik::#{string}" : string
    end
  protected
    # Attempt an API call request
    def self.handle_api_call method, params
      method_name = "#{self.to_s.gsub('Piwik::','')}.#{method}"
      config = load_config_from_file
      xml = self.call(method_name, params, config[:piwik_url], config[:auth_token])
      data = XmlSimple.xml_in(xml, {'ForceArray' => false})
      if data.is_a?(String)
        api_call_to_const(method_name,true).constantize.new(:data => [], :value => data)
      elsif data['row'].present?
        api_call_to_const(method_name,true).constantize.new(:data => data['row'])
      elsif data.is_a?(Hash)
        api_call_to_const(method_name,true).constantize.new(:data => data)
      else
        api_call_to_const(method_name,true).constantize.new(:data => [])
      end
    end
    
    # Attempt an API call request
    def self.api_call method, params
      config = load_config_from_file
      if params.is_a?(OpenStruct)
        params = params.marshal_dump
      end
      xml = self.call(method, params, config[:piwik_url], config[:auth_token])
      data = XmlSimple.xml_in(xml, {'ForceArray' => false})
      if data.is_a?(String)
        data
      elsif data['row'].present?
        data['row']
      elsif data.is_a?(Hash) and data['success'].is_a?(Hash)
        true
      elsif data.is_a?(Hash)
        data
      else
        []
      end
    end
  end
end