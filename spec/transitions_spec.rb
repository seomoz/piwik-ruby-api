require 'spec_helper'
describe 'Piwik::Transitions' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Transitions }
  
  describe "#get_translations" do
    assert_data_integrity(:get_translations)
    it { subject.get_translations(params).size.should eq(32) }
  end
end