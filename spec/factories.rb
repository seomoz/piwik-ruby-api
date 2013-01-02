require 'factory_girl'

FactoryGirl.define do
  factory :user, :class => 'Piwik::User' do
    login       "test_user"
    password    "changeme"
    email       "user@test.local"
    user_alias  "Test User"
  end
  
  factory :site, :class => 'Piwik::Site' do
    main_url  "http://test.local"
    name    "Test Site"
  end
end