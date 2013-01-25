require 'spec_helper'
describe 'Piwik::ImageGraph' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday', :apiModule => 'UserCountry', :apiAction => 'getCountry'} }
  subject { Piwik::ImageGraph }
  
  assert_value_integrity(:get) # for array responses
end