require 'spec_helper'
describe 'Piwik::VisitFrequency' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::VisitFrequency }

  assert_data_integrity(:get, :size => 10)
end