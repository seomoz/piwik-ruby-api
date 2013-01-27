module Piwik
  class Referers < ApiModule
    available_methods %W{
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
    
    # defining methods that are supposed to be called through a parent object extended with an api_scope
    # the @obj instance variable is set in the api_scope call. This is not very clean or anything,
    # and I am still researching a better way to do it, but the Piwik::Site API is certainly much cleaner
    class << self
      def websites(period=:day, date=Date.today)
        getWebsites(@obj.id_attr => @obj.id, :period => period, :date => date)
      end

      def websites_count(period=:day, date=Date.today)
        getNumberOfDistinctWebsites(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def keywords(period=:day, date=Date.today)
        getKeywords(@obj.id_attr => @obj.id, :period => period, :date => date)
      end

      def search_engines(period=:day, date=Date.today)
        getSearchEngines(@obj.id_attr => @obj.id, :period => period, :date => date)
      end

      def socials(period=:day, date=Date.today)
        getSocials(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
    end
  end
end