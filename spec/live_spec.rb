require 'spec_helper'
describe 'Piwik::Live' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Live }
  
  assert_data_integrity(:get_counters, :size => 3)
  assert_data_integrity(:get_last_visits_details, :size => 8)
end