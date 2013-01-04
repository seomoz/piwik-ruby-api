require 'spec_helper'
describe 'Piwik::Referers' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Referers }
  
  describe "#get_keywords" do
    assert_data_integrity(:get_keywords)
    it { subject.get_keywords(params).size.should eq(10) }
  end
  
  describe "#get_campaigns" do
    it { subject.get_campaigns(params).size.should eq(0) }
    it { subject.get_campaigns(params).empty?.should eq(true) }
  end
  
  describe "#get_referer_type" do
    assert_data_integrity(:get_referer_type)
    it { subject.get_referer_type(params).size.should eq(3) }
  end
  
  describe "#get_number_of_distinct_keywords" do
    assert_value_integrity(:get_number_of_distinct_keywords)
    it { subject.get_number_of_distinct_keywords(params).value.to_i.should eq(207) }
  end
  
  describe "#get_number_of_distinct_search_engines" do
    assert_value_integrity(:get_number_of_distinct_search_engines)
    it { subject.get_number_of_distinct_search_engines(params).value.to_i.should eq(7) }
  end
  
  describe "#get_number_of_distinct_websites" do
    assert_value_integrity(:get_number_of_distinct_websites)
    it { subject.get_number_of_distinct_websites(params).value.to_i.should eq(27) }
  end
  
  describe "#get_search_engines" do
    assert_data_integrity(:get_search_engines)
    it { subject.get_search_engines(params).size.should eq(7) }
  end
  
  describe "#get_socials" do
    it { subject.get_socials(params).size.should eq(0) }
  end
  
  describe "#get_urls_for_social" do
    it { subject.get_urls_for_social(params).size.should eq(0) }
  end
end