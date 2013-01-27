module Piwik
  class Actions < ApiModule
    available_methods %W{
      get
      getPageUrls
      getPageUrlsFollowingSiteSearch
      getPageTitlesFollowingSiteSearch
      getEntryPageUrls
      getExitPageUrls
      getPageUrl
      getPageTitles
      getEntryPageTitles
      getExitPageTitles
      getPageTitle
      getDownloads
      getDownload
      getOutlinks
      getOutlink
      getSiteSearchKeywords
      addPagesPerSearchColumn
      getSiteSearchNoResultKeywords
      getSiteSearchCategories
    }
    
    scoped_methods do
      def summary(period=:day, date=Date.today)
        get(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def urls(period=:day, date=Date.today)
        getPageUrls(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def entry_urls(period=:day, date=Date.today)
        getEntryPageUrls(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def exit_urls(period=:day, date=Date.today)
        getExitPageUrls(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def downloads(period=:day, date=Date.today)
        getDownloads(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
      
      def outlinks(period=:day, date=Date.today)
        getOutlinks(@obj.id_attr => @obj.id, :period => period, :date => date)
      end
    end
  end
end