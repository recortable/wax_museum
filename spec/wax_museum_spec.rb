require 'spec_helper'

describe WaxMuseum do
  it 'should exist' do
    WaxMuseum.should be_a(Module)
  end

  it 'should add and retrieve' do
    WaxMuseum.config do
      doc 'one', gdoc_id: 'gdoc_id'
    end

    WaxMuseum.find(:one).should be_present
    WaxMuseum.find('one').should be_present
  end
end
