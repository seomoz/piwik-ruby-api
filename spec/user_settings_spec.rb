require 'spec_helper'
describe 'Piwik::UserSettings' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::UserSettings }
  
  describe "#get_resolution" do
    assert_data_integrity(:get_resolution)
  end
  
  describe "#get_configuration" do
    assert_data_integrity(:get_configuration)
  end
  
  describe "#get_os" do
    assert_data_integrity(:get_os)
  end
  
  describe "#get_os_family" do
    assert_data_integrity(:get_os_family)
  end
  
  describe "#get_mobile_vs_desktop" do
    assert_data_integrity(:get_mobile_vs_desktop)
  end
  
  describe "#get_configuration" do
    assert_data_integrity(:get_browser_version)
  end
  
  describe "#get_configuration" do
    assert_data_integrity(:get_browser)
  end
  
  describe "#get_configuration" do
    assert_data_integrity(:get_browser_type)
  end
  
  describe "#get_configuration" do
    assert_data_integrity(:get_wide_screen)
  end
  
  describe "#get_plugin" do
    assert_data_integrity(:get_plugin)
  end
end