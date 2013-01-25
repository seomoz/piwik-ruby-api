module Piwik
  class Actions < ApiModule
    AVAILABLE_METHODS = %W{
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
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end