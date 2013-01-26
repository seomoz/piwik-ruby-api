require 'spec_helper'
describe 'Piwik::Goals' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Goals }
  
  assert_data_integrity(:get, :size => 4)
  assert_data_integrity(:get_goals, :size => 3)
  assert_data_integrity(:get_visits_until_conversion, :size => 13)
end