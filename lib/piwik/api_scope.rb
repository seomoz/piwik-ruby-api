module Piwik
  # Used to extend a wrapper class with class-aware api calls, allowing users to use a more DRY api interface.
  # Example:
  #
  #   site = Piwik::Site.load(7)
  #   p = site.actions # returns an extended version of the Piwik::Actions api module
  #   => Piwik::Actions
  #   p.outlinks # equivalent to Piwik::Actions.getOutlinks(:idSite => 7)
  #   => #<Piwik::Actions::Outlinks @data=[snip]>
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