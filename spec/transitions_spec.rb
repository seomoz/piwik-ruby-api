require 'spec_helper'
describe 'Piwik::Transitions' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::Transitions }
  
  describe "#get_translations" do
    it { subject.get_translations(params).should_not raise_error(NoMethodError) }
    it { subject.get_translations(params).size.should eq(32) }
    it { subject.get_translations(params).each.should be_a(Enumerator) }
    it { subject.get_translations(params).empty?.should eq(false) }
  end
end