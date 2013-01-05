require 'spec_helper'
describe 'Piwik::SitesManager' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::SitesManager }
  
=begin rdoc
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
=end

  describe "#get" do
    assert_data_integrity(:get) # for array responses
  end
  
  describe "#get_sites_with_admin_access" do
    assert_data_integrity(:get_sites_with_admin_access, :size => 4)
  end
  
  describe "#get_all_sites" do
    assert_data_integrity(:get_all_sites, :size => 4)
  end
  
  describe "#get_unique_site_timezones" do
    assert_value_integrity(:get_unique_site_timezones)
  end
  
  describe "#get_javascript_tag" do
    assert_value_integrity(:get_javascript_tag)
  end
end