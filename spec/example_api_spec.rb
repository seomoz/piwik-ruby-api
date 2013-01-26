require 'spec_helper'
describe 'Piwik::ExampleApi' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {} }
  subject { Piwik::ExampleApi }
  
  assert_value_integrity(:get_piwik_version, :value => '1.10.1')
end