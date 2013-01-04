module Piwik
  class Transitions < ApiModule
    AVAILABLE_METHODS = %W{
      getTransitionsForPageTitle
      getTransitionsForPageUrl
      getTransitionsForAction
      getTranslations
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end