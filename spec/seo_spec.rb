require 'spec_helper'
describe 'Piwik::SEO' do
  before {
    stub_api_calls
  }
  
  let(:params) { {:url => 'http://site.test'} }
  subject { Piwik::SEO }
  
  describe "#get_rank" do
    it { subject.get_rank(params).should_not raise_error(NoMethodError) }
    it { subject.get_rank(params).size.should eq(5) }
    it { subject.get_rank(params).data.first['label'].should eq('Google PageRank') }
    it { subject.get_rank(params).data.first['rank'].should eq('7') }
    it { subject.get_rank(params).each.should be_a(Enumerator) }
    it { subject.get_rank(params).empty?.should eq(false) }
  end
end