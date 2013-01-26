require 'spec_helper'
describe 'Piwik::CustomVariables' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::CustomVariables }
  
  assert_data_integrity(:get_custom_variables)
end