module Piwik
  class SitesManager < ApiModule
    AVAILABLE_METHODS = %W{
      getJavascriptTag
      getSitesFromGroup
      getSitesGroups
      getSiteFromId
      getSiteUrlsFromId
      getAllSites
      getAllSitesId
      getSitesIdWithVisits
      getSitesWithAdminAccess
      getSitesWithViewAccess
      getSitesWithAtLeastViewAccess
      getSitesIdWithAdminAccess
      getSitesIdWithViewAccess
      getSitesIdWithAtLeastViewAccess
      getSitesIdFromSiteUrl
      addSite
      deleteSite
      addSiteAliasUrls
      getIpsForRange
      setGlobalExcludedIps
      setGlobalSearchParameters
      getSearchKeywordParametersGlobal
      getSearchCategoryParametersGlobal
      getExcludedQueryParametersGlobal
      getExcludedUserAgentsGlobal
      setGlobalExcludedUserAgents
      isSiteSpecificUserAgentExcludeEnabled
      setSiteSpecificUserAgentExcludeEnabled
      setGlobalExcludedQueryParameters
      getExcludedIpsGlobal
      getDefaultCurrency
      setDefaultCurrency
      getDefaultTimezone
      setDefaultTimezone
      updateSite
      getCurrencyList
      getCurrencySymbols
      getTimezonesList
      getUniqueSiteTimezones
      getPatternMatchSites
    }
    
    def self.get *args
      self.get_site_from_id *args
    end
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end