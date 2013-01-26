require 'spec_helper'
describe 'Piwik::MultiSites' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::MultiSites }
  
  assert_data_integrity(:get_one, :size => 8)
end