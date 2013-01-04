module Piwik
  class UserSettings < ApiModule
    AVAILABLE_METHODS = %W{
      getResolution
      getConfiguration
      getOS
      getOSFamily
      getMobileVsDesktop
      getBrowserVersion
      getBrowser
      getBrowserType
      getWideScreen
      getPlugin
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end