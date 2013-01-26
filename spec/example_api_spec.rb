require 'spec_helper'
describe 'Piwik::ExampleApi' do
  before {
    stub_api_calls
  }
  
  let(:params) {}
  subject { Piwik::ExampleApi }
  
  assert_value_integrity(:get_piwik_version, :value => '1.10.1')
  assert_value_integrity(:get_null, :value => nil)
  
  it { expect { subject.get_object }.to raise_error(Piwik::ApiError) }
end