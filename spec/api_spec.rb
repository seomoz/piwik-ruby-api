require 'spec_helper'
describe 'Piwik::API' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::API }
  
  assert_value_integrity(:get_piwik_version, :value => '1.10.1')
  assert_value_integrity(:get_logo_url, :value => 'http://demo.piwik.org/themes/logo.png')
end