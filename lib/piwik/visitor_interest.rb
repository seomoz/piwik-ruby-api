module Piwik
  class VisitorInterest < ApiModule
    available_methods %W{
      getNumberOfVisitsPerVisitDuration
      getNumberOfVisitsPerPage
      getNumberOfVisitsByDaysSinceLast
      getNumberOfVisitsByVisitCount
    }
  end
end