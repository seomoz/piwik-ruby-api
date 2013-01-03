module Piwik
  class ApiResponse < Base
    attr_accessor :data,:value
    
    def empty?
      data.blank? and value.blank?
    end
    
    def initialize opts = {}
      opts.map {|k,v| self.send(:"#{k}=",v) }
    end
    
    # try to pass method to the data variable
    def method_missing(method, *args, &block)
      if self.data.respond_to?(method)
        self.data.send(method,*args,&block)
      else
        super
      end
    end
  end
end
  