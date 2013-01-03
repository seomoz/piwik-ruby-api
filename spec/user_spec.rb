require 'spec_helper'
describe 'Piwik::User' do  
  before do
    stub_api_calls
    # add a few specific stubs
    Piwik::Base.stub(:call).with('UsersManager.getUser',{:userLogin => 'mike_ness'},/.*/,/.*/) { raise Piwik::ApiError, 'mock api error' }
  end
  
  
  subject { build(:user) }
  
  its(:login) { should eq('test_user') }
  its(:password) { should eq('changeme') }
  its(:email) { should eq('user@test.local') }
  its(:user_alias) { should eq('Test User') }
  
  it { 
    subject.save.should eq(true)
    subject.email = 'user2@test.local'
    subject.update.should eq(true)
    subject.destroy.should eq(true)
  }
  
  it { expect {Piwik::User.load('mike_ness')}.to raise_error(Piwik::ApiError) }
  describe "#load existing" do
    before { 
      @user = build(:user) 
      @user.save
    }
    it { expect {Piwik::User.load(@user.login)}.to_not raise_error }
  end
end