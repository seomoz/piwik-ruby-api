require 'spec_helper'
describe 'Piwik::Site' do
  before do
    stub_api_calls
  end
  
  subject { build(:site) }
  its(:main_url) { should eq('http://test.local') }
  its(:name) { should eq('Test Site') }
  its(:config) { should eq({:piwik_url => PIWIK_URL, :auth_token => PIWIK_TOKEN}) }
  
  it { 
    subject.save.should eq(true)
    subject.name = 'Karate Site'
    subject.update.should eq(true)
    subject.destroy.should eq(true)
  }
  
  describe 'with wrong id' do
    before {Piwik::SitesManager.stub(:call).with('SitesManager.getSiteFromId',{:idSite => 666}, /.*/, /.*/).and_return('<result>0</result>')}
    # TODO: I can't get this test to behave. hm.
    xit { expect {Piwik::Site.load(666)}.to raise_error(Piwik::UnknownSite) }
  end
  
  describe "#load existing" do
    before { 
      @site = build(:site) 
      @site.save
    }
    it { expect {Piwik::Site.load(@site.id)}.to_not raise_error }
  end
end