module Piwik
  class VisitsSummary < ApiModule
    AVAILABLE_METHODS = %W{
      get
      getVisits
      getUniqueVisitors
      getActions
      getMaxActions
      getBounceCount
      getVisitsConverted
      getSumVisitsLength
      getSumVisitsLengthPretty
    }
    
    AVAILABLE_METHODS.each do |method|
      if method != 'get'
        class_eval %{
          class #{self.api_call_to_const(method)} < Piwik::ApiResponse
          end
        }, __FILE__, __LINE__
      end
    end
  end
end