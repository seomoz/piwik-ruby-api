module Piwik
  # used to do basic typecasting to API response values
  module Typecast
    def self.included(base)
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      private
        def typecast(thing)
          if thing.is_a?(String) and thing =~ /^[0-9]+$/
            thing.to_i
          else
            thing
          end
        end
    end
  end
end