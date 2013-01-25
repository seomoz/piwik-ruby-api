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
  end
end