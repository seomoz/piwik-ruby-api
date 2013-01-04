require 'spec_helper'
describe 'Piwik::VisitsSummary' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::VisitsSummary }
  
  describe '#get' do
    assert_data_integrity(:get, :size => 10)
    it { subject.get(params).data['nb_uniq_visitors'].to_i.should eq(914) }
  end
  
  describe "#get_visits" do
    assert_value_integrity(:get_visits, :value => 200)
  end
  
  describe "#get_unique_visitors" do
    assert_value_integrity(:get_unique_visitors, :value => 100)
  end
  
  describe "#get_actions" do
    assert_value_integrity(:get_actions, :value => 55)
  end
  
  describe "#get_max_actions" do
    assert_value_integrity(:get_max_actions, :value => 66)
  end
  
  describe "#get_bounce_count" do
    assert_value_integrity(:get_bounce_count, :value => 51)
  end
  
  describe "#get_visits_converted" do
    assert_value_integrity(:get_visits_converted, :value => 0)
  end
  
  describe "#get_sum_visits_length" do
    assert_value_integrity(:get_sum_visits_length, :value => 143952)
  end
  
  describe "#get_sum_visits_length_pretty" do
    assert_value_integrity(:get_sum_visits_length_pretty, :value => '1 days 15 hours')
  end
end