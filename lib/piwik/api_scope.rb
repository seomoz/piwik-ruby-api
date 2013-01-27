module Piwik
  module ApiScope
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def api_scope name, scope_options = {}, &block
        name = name.to_sym
        class_name = "Piwik::#{scope_options[:class_name] ? scope_options[:class_name] : name.to_s.camelize}"
        extension =  Module.new(&Proc.new) if block_given?
        instance_eval do          
          define_method name do
            klass = class_name.constantize
            klass.extend(extension) if block_given?
            klass.instance_variable_set(:@obj, self)
            klass
          end
        end
        self
      end
    end
  end
end