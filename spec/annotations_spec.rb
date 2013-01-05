require 'spec_helper'
describe 'Piwik::Annotations' do
  before {
    stub_api_calls
  }
  
  context "crud" do
    let(:params) { {:idSite => 1, :note => 'test', :date => 'yesterday'} }
    before { Piwik::ApiModule.stub(:call).with('Annotations.add',params,/.*/,/.*/).and_return(File.read('./spec/files/Annotations.add.xml')) }
    subject { Piwik::Annotations.add(params) }
    
    describe '#add' do
      it { subject.should be_a(Piwik::Annotation) }
      it { subject.date.should eq('yesterday') }
      it { subject.note.should eq('test') }
      it { subject.starred.should eq(0) }
      it { subject.idNote.should eq(0) }
      it { subject.canEditOrDelete.should eq(1) }
    end

    describe '#save' do
      let(:params) { {:date => "yesterday", :note => "test", :starred => 0, :user => "admin", :idNote => 0, :canEditOrDelete => 1} }
      before { 
        Piwik::ApiModule.stub(:call).with('Annotations.save',params,/.*/,/.*/).and_return(File.read('./spec/files/Annotations.add.xml'))
      }
      it { subject.save.should be(true) }
    end

    describe '#delete' do
      let(:params) { {:date => "yesterday", :note => "test", :starred => 0, :user => "admin", :idNote => 0, :canEditOrDelete => 1} }
      before { 
        Piwik::ApiModule.stub(:call).with('Annotations.delete',params,/.*/,/.*/).and_return(success_response)
      }
      it { subject.delete.should eq(true) }
    end
  end
  
  describe "#get_all" do
    let(:params) { {:idSite => 1, :date => 'yesterday', :period => 'week'} }
    subject { Piwik::Annotations }
    
    assert_data_integrity(:get_all)
  end
  
  describe "#get_annotation_count_for_dates" do
    let(:params) { {:idSite => 1, :date => 'yesterday', :period => 'week'} }
    subject { Piwik::Annotations }
    
    assert_data_integrity(:get_annotation_count_for_dates)
  end
end