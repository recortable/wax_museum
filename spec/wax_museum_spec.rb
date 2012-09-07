require 'spec_helper'

describe WaxMuseum do
  before do
    WaxMuseum::Configuration.init
    WaxMuseum.config do
      doc 'one', id: 'gdoc_id'
    end
  end

  it 'should add and retrieve' do

    WaxMuseum.find(:one).should be_present
    WaxMuseum.find('one').should be_present
  end

  it 'should retrieve document' do
    doc = WaxMuseum.find('one')
    doc.path.should eq('one')
    doc.id.should eq('gdoc_id')
  end
end
