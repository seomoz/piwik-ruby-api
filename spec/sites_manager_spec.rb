require 'spec_helper'
describe 'Piwik::SitesManager' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::SitesManager }

  describe "#get" do
    it { subject.get(params).should be_a(Piwik::Site) }
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