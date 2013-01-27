module Piwik
  class Goals < ApiModule
    available_methods %W{
      getGoals
      addGoal
      updateGoal
      deleteGoal
      getItemsSku
      getItemsName
      getItemsCategory
      get
      getDaysToConversion
      getVisitsUntilConversion
    }
    
    scoped_methods do
      def load goal_id, params = {}
        get(defaults.merge(params).merge(:idGoal => goal_id))
      end
      
      def all
        getGoals(defaults)
      end
      
      # params: (name, matchAttribute, pattern, patternType, caseSensitive = '', revenue = '', allowMultipleConversionsPerVisit = '')
      def add params = {}
        addGoal(defaults.merge(params))
      end
      
      # params: (name, matchAttribute, pattern, patternType, caseSensitive = '', revenue = '', allowMultipleConversionsPerVisit = '')
      def update goal_id, params = {}
        updateGoal(defaults.merge(params).merge(:idGoal => goal_id))
      end
      
      def delete goal_id
        deleteGoal(defaults.merge(:idGoal => goal_id))
      end
    end
  end
end