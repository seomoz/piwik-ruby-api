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
      def converted(period=:day, date=Date.today)
        getVisitsConverted(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def summary(period=:day, date=Date.today)
        get(@obj.id_attr => @obj.id, :period => period, :date => date)
      end

      def count(period=:day, date=Date.today)
        getVisits(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def uniques(period=:day, date=Date.today)
        getUniqueVisitors(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def actions(period=:day, date=Date.today)
        getActions(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def max_actions(period=:day, date=Date.today)
        getMaxActions(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def bounces(period=:day, date=Date.today)
        getBounceCount(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def length(period=:day, date=Date.today)
        getSumVisitsLength(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def pretty_length(period=:day, date=Date.today)
        getSumVisitsLengthPretty(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end
    end
  end
end