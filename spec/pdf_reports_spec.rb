require 'spec_helper'
describe 'Piwik::PdfReports' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::PdfReports }
  
  assert_data_integrity(:getReports)
end