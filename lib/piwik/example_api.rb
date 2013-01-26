module Piwik
  class ExampleApi < ApiModule
    available_methods %W{
      getPiwikVersion
      getAnswerToLife
      getObject
      getSum
      getNull
      getDescriptionArray
      getCompetitionDatatable
      getMoreInformationAnswerToLife
      getMultiArray
    }
  end
end