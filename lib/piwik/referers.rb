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
    
    scoped_methods do
      def websites(period=:day, date=Date.today)
        getWebsites(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def websites_count(period=:day, date=Date.today)
        getNumberOfDistinctWebsites(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end
      
      def keywords(period=:day, date=Date.today)
        getKeywords(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def keywords_for_title(title, period=:day, date=Date.today)
        getKeywordsForPageTitle(@obj.id_attr => @obj.id, :title => title, :period => period, :date => date)
      end
      
      def keywords_for_url(url, period=:day, date=Date.today)
        getKeywordsForPageUrl(@obj.id_attr => @obj.id, :url => url, :period => period, :date => date)
      end
      
      def keywords_count(period=:day, date=Date.today)
        getNumberOfDistinctKeywords(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end
      
      def search_engines(period=:day, date=Date.today)
        getSearchEngines(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def search_engines_count(period=:day, date=Date.today)
        getNumberOfDistinctSearchEngines(@obj.id_attr => @obj.id, :period => period, :date => date).value
      end

      def socials(period=:day, date=Date.today)
        getSocials(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
    end
  end
end