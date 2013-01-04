require 'spec_helper'
describe 'Piwik::{{name}}' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::{{name}} }
  
  describe "#a_method" do
    assert_data_integrity(:a_method) # for array responses
    assert_value_integrity(:a_method) # for single value responses
    it { subject.a_method(params).size.should eq(5) } # other specific tests
  end
end