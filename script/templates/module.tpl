module Piwik
  class {{name}} < ApiModule
    AVAILABLE_METHODS = %W{
      TODO: add available methods array
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end