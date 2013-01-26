module Piwik
  class API < ApiModule
    available_methods %W{
      getPiwikVersion
      getSettings
      getDefaultMetricTranslations
      getDefaultMetrics
      getDefaultProcessedMetrics
      getDefaultMetricsDocumentation
      getSegmentsMetadata
      getLogoUrl
      getHeaderLogoUrl
      getMetadata
      getReportMetadata
      getProcessedReport
      get
      getRowEvolution
      getBulkRequest
    }
  end
end