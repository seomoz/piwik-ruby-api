require 'spec_helper'
describe 'Piwik::{{name}}' do
  before {
    stub_api_calls
  }
  
  let(:params) { # TODO: Set any API params here }
  subject { Piwik::{{name}} }
  
  describe "#a_method" do
    it { subject.a_method(params).should_not raise_error(NoMethodError) }
    it { subject.a_method(params).size.should eq(5) }
    it { subject.a_method(params).each.should be_a(Enumerator) }
    it { subject.a_method(params).empty?.should eq(false) }
  end
end