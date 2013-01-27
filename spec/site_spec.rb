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
      subject.visits.summary.should be_a(Piwik::VisitsSummary)
      subject.visits.summary.nb_visits.should eq(995)
      subject.visits.summary.nb_uniq_visitors.should eq(914)
      subject.visits.summary.nb_actions.should eq(2161)
      subject.visits.summary.max_actions.should eq(47)
      subject.visits.summary.bounce_count.should eq(704)
      subject.visits.summary.sum_visit_length.should eq(143952)
    end
    
    it { subject.visits.count.should eq(200) }
    it { subject.visits.actions.should eq(55) }
    it { subject.visits.uniques.should eq(100) }
    it { subject.visits.bounces.should eq(51) }
    it { subject.visits.converted.should eq(0) }
    it { subject.visits.max_actions.should eq(66) }
    it { subject.visits.length.should eq(143952) }
    it { subject.visits.pretty_length.should eq("1 days 15 hours") }
    
    it { subject.actions.summary.should be_a(Piwik::Actions) }
    it { subject.actions.urls.size.should eq(7) }
    it { subject.actions.entry_urls.size.should eq(5) }
    it { subject.actions.exit_urls.size.should eq(5) }
    it { subject.actions.downloads.size.should eq(2) }
    it { subject.actions.outlinks.size.should eq(11) }
    
    it { subject.annotations.first.size.should eq(2) }
    
    it { subject.referers.websites.size.should eq(27) }
    it { subject.referers.websites_count.should eq(27) }
    it { subject.referers.keywords.size.should eq(10) }
    it { subject.referers.keywords_for_title('A page title').size.should eq(1) }
    it { subject.referers.keywords_for_url('http://mysite.com/page.html').size.should eq(5) }
    it { subject.referers.keywords_count.should eq(207) }
    it { subject.referers.search_engines.size.should eq(7) }
    it { subject.referers.search_engines_count.should eq(7) }
    it { subject.referers.socials.size.should eq(0) }
  end
end