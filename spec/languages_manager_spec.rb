require 'spec_helper'
describe 'Piwik::LanguagesManager' do
  before {
    stub_api_calls
  }
  
  let(:params) { { :languageCode => 'en' } }
  subject { Piwik::LanguagesManager }
  
  assert_data_integrity(:get_available_language_names, :size => 46)
  assert_data_integrity(:get_available_languages, :size => 46)
  assert_value_integrity(:is_language_available, :value => 1)
end