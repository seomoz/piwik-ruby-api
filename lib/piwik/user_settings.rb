module Piwik
  class UserSettings < ApiModule
    available_methods %W{
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
  end
end