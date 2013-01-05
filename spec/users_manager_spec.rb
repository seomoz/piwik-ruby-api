require 'spec_helper'
describe 'Piwik::UsersManager' do
  before {
    stub_api_calls
  }
  
  # TODO: Specify required params
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::UsersManager }
  
  describe "#get" do
    it { subject.get(params).should be_a(Piwik::User) }
  end
  
  describe "#get_users" do
    assert_data_integrity(:get_users)
  end
  
  describe "#get_users_login" do
    assert_data_integrity(:get_users)
  end
  
  describe "#user_exists" do
    assert_value_integrity(:user_exists, :value => 0)
  end
end