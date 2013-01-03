module Piwik
  class Referers < ApiModule
    AVAILABLE_METHODS = %W{
      getRefererType
      getKeywords
      getKeywordsForPageUrl
      getKeywordsForPageTitle
      getSearchEnginesFromKeywordId
      getSearchEngines
      getKeywordsFromSearchEngineId
      getCampaigns
      getKeywordsFromCampaignId
      getWebsites
      getSocials
      getUrlsForSocial
      getUrlsFromWebsiteId
      getNumberOfDistinctSearchEngines
      getNumberOfDistinctKeywords
      getNumberOfDistinctCampaigns
      getNumberOfDistinctWebsites
      getNumberOfDistinctWebsitesUrls
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end