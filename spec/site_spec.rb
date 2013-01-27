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
  
  it { subject.annotations.first.size.should eq(2) }
  it { subject.seo_info.first['rank'].to_i.should eq(7) }
  
  describe '#visits' do
    subject { build(:site).visits }
    it { subject.summary.should be_a(Piwik::VisitsSummary) }

    it { subject.count.should eq(200) }
    it { subject.actions.should eq(55) }
    it { subject.uniques.should eq(100) }
    it { subject.bounces.should eq(51) }
    it { subject.converted.should eq(0) }
    it { subject.max_actions.should eq(66) }
    it { subject.length.should eq(143952) }
    it { subject.pretty_length.should eq("1 days 15 hours") }
  end
  
  describe '#actions' do
    subject { build(:site).actions }
    
    it { subject.summary.should be_a(Piwik::Actions) }
    it { subject.urls.size.should eq(7) }
    it { subject.url('/index.html').nb_visits.should eq(48) }
    it { subject.entry_urls.size.should eq(5) }
    it { subject.exit_urls.size.should eq(5) }
    it { subject.downloads.size.should eq(2) }
    it { subject.outlinks.size.should eq(11) }
    it { subject.outlink('http://mysite.com').exit_nb_visits.should eq(5) }
  end
  
  describe '#referers' do
    subject { build(:site).referers }
    
    it { subject.websites.size.should eq(27) }
    it { subject.websites_count.should eq(27) }
    it { subject.keywords.size.should eq(10) }
    it { subject.keywords_for_title('A page title').size.should eq(1) }
    it { subject.keywords_for_url('http://mysite.com/page.html').size.should eq(5) }
    it { subject.keywords_count.should eq(207) }
    it { subject.search_engines.size.should eq(7) }
    it { subject.search_engines_count.should eq(7) }
    it { subject.socials.size.should eq(0) }
  end
  
  describe '#goals' do
    subject { build(:site).goals }
    
    it { subject.all.size.should eq(3) }
    it { subject.load(1).nb_conversions.should eq(82) }
    it { subject.update(1,{:pattern => 2}).should_not raise_error(Piwik::ApiError) }
    it { subject.delete(1).should_not raise_error(Piwik::ApiError) }
    it { subject.add(:name => 'test', 'matchAttribute' => '/', :pattern => '/', :patternType => 1).should_not raise_error(Piwik::ApiError) }
  end
  
  describe '#transitions' do
    subject { build(:site).transitions }
    
    it { subject.for_action('name','type').should be_a(Piwik::Transitions::TransitionsForAction) }
    it { subject.for_title('My page title').should be_a(Piwik::Transitions::TransitionsForPageTitle) }
    it { subject.for_url('http://mysite.com').should be_a(Piwik::Transitions::TransitionsForPageUrl) }
    it { subject.translations.size.should eq(32) }
  end
  
  describe "that exists" do
    before { 
      @site = build(:site) 
      @site.save
    }
    it { expect {Piwik::Site.load(@site.id)}.to_not raise_error }
  end
end