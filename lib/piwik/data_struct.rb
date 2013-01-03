module Piwik
  class DataStruct < Base
    attr_accessor :data,:value
    
    def empty?
      data.blank? and value.blank?
    end
    
    def initialize opts = {}
      opts.map {|k,v| self.send(:"#{k}=",v) }
    end
    
    def method_missing(method, *args, &block)
      if self.data.respond_to?(method)
        self.data.send(method,*args,&block)
      else
        super
      end
    end
    
    # Catch incoming method calls and try to format them and send them over to the api
    def self.method_missing(method, *args, &block)
      formatted_method = method.to_s.camelize(:lower)
      # connect to API if this is a valid-looking method in the current class context
      if self::AVAILABLE_METHODS.include?(formatted_method)
        handle_api_call(formatted_method, args.first)
      else
        super
      end
    end
  protected
    # Attempt an API call request
    def self.handle_api_call method, params
      method_name = "#{self.to_s.gsub('Piwik::','')}.#{method}"
      config = load_config_from_file
      xml = self.call(method_name, params, config[:piwik_url], config[:auth_token])
      data = XmlSimple.xml_in(xml, {'ForceArray' => false})
      if data.is_a?(String)
        self.new(:data => [], :value => data)
      elsif data['row'].present?
        self.new(:data => data['row'])
      else
        self.new(:data => [])
      end
    end
  end
end