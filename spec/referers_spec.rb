require 'spec_helper'
describe 'Piwik::Referers' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Referers }
  
  describe "#get_keywords" do
    it { subject.get_keywords(params).should_not raise_error(NoMethodError) }
    it { subject.get_keywords(params).size.should eq(10) }
    it { subject.get_keywords(params).each.should be_a(Enumerator) }
    it { subject.get_keywords(params).empty?.should eq(false) }
  end
  
  describe "#get_campaigns" do
    it { subject.get_campaigns(params).should_not raise_error(NoMethodError) }
    it { subject.get_campaigns(params).each.should be_a(Enumerator) }
    it { subject.get_campaigns(params).size.should eq(0) }
    it { subject.get_campaigns(params).empty?.should eq(true) }
  end
  
  describe "#get_referer_type" do
    it { subject.get_referer_type(params).should_not raise_error(NoMethodError) }
    it { subject.get_referer_type(params).each.should be_a(Enumerator) }
    it { subject.get_referer_type(params).size.should eq(3) }
    it { subject.get_referer_type(params).empty?.should eq(false) }
  end
  
  describe "#get_number_of_distinct_keywords" do
    it { subject.get_number_of_distinct_keywords(params).should_not raise_error(NoMethodError) }
    it { subject.get_number_of_distinct_keywords(params).value.to_i.should eq(207) }
    it { subject.get_number_of_distinct_keywords(params).empty?.should eq(false) }
  end
  
  describe "#get_number_of_distinct_search_engines" do
    it { subject.get_number_of_distinct_search_engines(params).should_not raise_error(NoMethodError) }
    it { subject.get_number_of_distinct_search_engines(params).value.to_i.should eq(7) }
    it { subject.get_number_of_distinct_search_engines(params).empty?.should eq(false) }
  end
  
  describe "#get_number_of_distinct_websites" do
    it { subject.get_number_of_distinct_websites(params).should_not raise_error(NoMethodError) }
    it { subject.get_number_of_distinct_websites(params).value.to_i.should eq(27) }
    it { subject.get_number_of_distinct_websites(params).empty?.should eq(false) }
  end
  
  describe "#get_search_engines" do
    it { subject.get_search_engines(params).should_not raise_error(NoMethodError) }
    it { subject.get_search_engines(params).size.should eq(7) }
    it { subject.get_search_engines(params).each.should be_a(Enumerator) }
    it { subject.get_search_engines(params).empty?.should eq(false) }
  end
  
  describe "#get_socials" do
    it { subject.get_socials(params).should_not raise_error(NoMethodError) }
    it { subject.get_socials(params).each.should be_a(Enumerator) }
    it { subject.get_socials(params).size.should eq(0) }
    it { subject.get_socials(params).empty?.should eq(true) }
  end
  
  describe "#get_urls_for_social" do
    it { subject.get_urls_for_social(params).should_not raise_error(NoMethodError) }
    it { subject.get_urls_for_social(params).each.should be_a(Enumerator) }
    it { subject.get_urls_for_social(params).size.should eq(0) }
    it { subject.get_urls_for_social(params).empty?.should eq(true) }
  end
end