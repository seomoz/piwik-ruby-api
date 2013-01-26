module Piwik
  class CustomVariables < ApiModule
    available_methods %W{
      getCustomVariables
      getCustomVariablesValuesFromNameId
    }
  end
end