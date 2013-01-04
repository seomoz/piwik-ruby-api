require 'spec_helper'
describe 'Piwik::VisitTime' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::VisitTime }
  
  describe "#get_visit_information_per_local_time" do
    assert_data_integrity(:get_visit_information_per_local_time)
    it { subject.get_visit_information_per_local_time(params).size.should eq(8) }
  end
  
  describe "#get_visit_information_per_server_time" do
    assert_data_integrity(:get_visit_information_per_server_time)
    it { subject.get_visit_information_per_server_time(params).size.should eq(5) }
  end
  
  describe "#get_by_day_of_week" do
    assert_data_integrity(:get_by_day_of_week)
    it { subject.get_by_day_of_week(params).size.should eq(7) }
  end
end