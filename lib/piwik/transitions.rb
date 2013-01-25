module Piwik
  class Transitions < ApiModule
    available_methods %W{
      getTransitionsForPageTitle
      getTransitionsForPageUrl
      getTransitionsForAction
      getTranslations
    }
  end
end