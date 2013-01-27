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
    
    xit { expect {Piwik::Site.load(666)}.to raise_error(Piwik::UnknownSite) }
  end
  
  describe "that exists" do
    before { 
      @site = build(:site) 
      @site.save
    }
    it { expect {Piwik::Site.load(@site.id)}.to_not raise_error }
    
    
    it "visits summary should be accessible" do
      subject.summary.should be_a(Piwik::VisitsSummary)
      subject.summary.nb_visits.should eq(995)
      subject.summary.nb_uniq_visitors.should eq(914)
      subject.summary.nb_actions.should eq(2161)
      subject.summary.max_actions.should eq(47)
      subject.summary.bounce_count.should eq(704)
      subject.summary.sum_visit_length.should eq(143952)
    end
    
    it { subject.visits.should eq(200) }
    it { subject.actions.should eq(55) }
    it { subject.unique_visitors.should eq(100) }
    it { subject.bounce_count.should eq(51) }
    it { subject.sum_visits_length.should eq(143952) }
    it { subject.annotations.first.size.should eq(2) }
    
    it { subject.referers.websites.size.should eq(27) }
    it { subject.referers.websites_count.should eq(27) }
    it { subject.referers.keywords.size.should eq(10) }
    it { subject.referers.search_engines.size.should eq(7) }
    it { subject.referers.socials.size.should eq(0) }
  end
end