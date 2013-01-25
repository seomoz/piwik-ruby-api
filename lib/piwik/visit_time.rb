module Piwik
  class VisitTime < ApiModule
    available_methods %W{
      getVisitInformationPerLocalTime
      getVisitInformationPerServerTime
      getByDayOfWeek
    }
  end
end