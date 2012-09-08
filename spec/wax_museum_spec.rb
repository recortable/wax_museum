require 'spec_helper'

describe WaxMuseum do
  before do
    WaxMuseum::Configuration.init
    WaxMuseum.config do
      publish 'one', 'id'
    end
  end

  it 'should retrieve by key' do
    WaxMuseum.find(:one).should be_present
    WaxMuseum.find('one').should be_present
  end

  it 'should retrieve valid document' do
    doc = WaxMuseum.find('one')
    doc.path.should eq('one')
    doc.id.should eq('id')
    doc.type.should eq('gdoc')
  end
end
