module Piwik
  class Live < ApiModule
    AVAILABLE_METHODS = %W{
      getCounters
      getLastVisitsDetails
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end