module Piwik
  class VisitsSummary < ApiModule
    available_methods %W{
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
  end
end