require 'spec_helper'
describe 'Piwik::UserCountry' do
  before {
    stub_api_calls
  }
  let(:params) { {:idSite => 1, :period => 'day', :date => 'yesterday'} }
  subject { Piwik::UserCountry }
  
  describe '#get_country' do
    assert_data_integrity(:get_country)
  end
  
  describe '#get_continent' do
    assert_data_integrity(:get_continent)
  end
  
  describe '#get_region' do
    assert_data_integrity(:get_region)
  end
  
  describe '#get_city' do
    assert_data_integrity(:get_city)
  end
  
  describe '#get_number_of_distinct_countries' do
    assert_value_integrity(:get_number_of_distinct_countries)
  end
  
  describe "#get_location_from_ip" do
    let(:params) { { :ip => '194.57.91.215' } }
    assert_data_integrity(:get_location_from_ip, :size => 12)
  end
end