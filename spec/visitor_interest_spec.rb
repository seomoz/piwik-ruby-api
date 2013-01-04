require 'spec_helper'
describe 'Piwik::VisitorInterest' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::VisitorInterest }
  
  describe "#get_number_of_visits_per_visit_duration" do
    assert_data_integrity(:get_number_of_visits_per_visit_duration)
    it { subject.get_number_of_visits_per_visit_duration(params).size.should eq(10) }
  end
  
  describe "#get_number_of_visits_per_page" do
    assert_data_integrity(:get_number_of_visits_per_page)
    it { subject.get_number_of_visits_per_page(params).size.should eq(10) }
  end
  
  describe "#get_number_of_visits_by_days_since_last" do
    assert_data_integrity(:get_number_of_visits_by_days_since_last)
    it { subject.get_number_of_visits_by_days_since_last(params).size.should eq(15) }
  end
  
  describe "#get_number_of_visits_by_visit_count" do
    assert_data_integrity(:get_number_of_visits_by_visit_count)
    it { subject.get_number_of_visits_by_visit_count(params).size.should eq(14) }
  end
end