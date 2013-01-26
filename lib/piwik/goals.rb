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
  end
end