require 'spec_helper'
describe 'Piwik::Provider' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Provider }
  
  assert_data_integrity(:get_provider, :size => 10)
end