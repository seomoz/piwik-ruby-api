module Piwik
  module DataMethods
    def self.included(base)
      include Piwik::Typecast
      base.send(:include, InstanceMethods)
      attr_accessor :data,:value
    end
    
    module InstanceMethods
      def empty?
        data.blank? and value.blank?
      end

      def value
        typecast(@value)
      end

      def initialize opts = {}
        opts.map {|k,v| self.send(:"#{k}=",v) }
      end

      # try to pass method to the data variable
      def method_missing(method, *args, &block)
        if self.data.respond_to?(method)
          typecast(self.data.send(method,*args,&block))
        elsif self.data.is_a?(Hash) && self.data.key?(method.to_s)
          typecast(self.data[method.to_s])
        else
          super
        end
      end
    end
  end
end