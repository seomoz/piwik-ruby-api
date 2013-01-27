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
  
    scoped_methods do
      def converted params = {}
        getVisitsConverted(defaults.merge(params)).value
      end

      def summary params = {}
        get(defaults.merge(params))
      end

      def count params = {}
        getVisits(defaults.merge(params)).value
      end

      def uniques params = {}
        getUniqueVisitors(defaults.merge(params)).value
      end

      def actions params = {}
        getActions(defaults.merge(params)).value
      end

      def max_actions params = {}
        getMaxActions(defaults.merge(params)).value
      end

      def bounces params = {}
        getBounceCount(defaults.merge(params)).value
      end

      def length params = {}
        getSumVisitsLength(defaults.merge(params)).value
      end

      def pretty_length params = {}
        getSumVisitsLengthPretty(defaults.merge(params)).value
      end
    end
  end
end