module Piwik
  class VisitorInterest < ApiModule
    AVAILABLE_METHODS = %W{
      getNumberOfVisitsPerVisitDuration
      getNumberOfVisitsPerPage
      getNumberOfVisitsByDaysSinceLast
      getNumberOfVisitsByVisitCount
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end