require 'spec_helper'
describe 'Piwik::Site' do
  subject { build(:site) }
  
  its(:main_url) { should eq('http://test.local') }
  its(:name) { should eq('Test Site') }
  
  it { 
    subject.save.should eq(true)
    subject.name = 'Karate Site'
    subject.update.should eq(true)
    subject.destroy.should eq(true)
  }
  
  it { expect {Piwik::Site.load(666)}.to raise_error(Piwik::UnknownSite) }
  describe "#load existing" do
    before { 
      @site = build(:site) 
      @site.save
    }
    after { @site.destroy }
    it { expect {Piwik::Site.load(@site.id)}.to_not raise_error }
  end
end