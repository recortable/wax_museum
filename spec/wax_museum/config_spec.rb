require 'spec_helper'

include WaxMuseum

describe Configuration do
  it 'no setup' do
    Configuration.init
    Configuration.paths.should be_empty
  end

  it 'setup docs using a string' do
    Configuration.init
    Configuration.publish 'one', 'gdoc_id'
    Configuration.paths.should include('one')
    Configuration.properties('one')[:id].should eq('gdoc_id')
    Configuration.properties('one')[:type].should eq('gdoc')
  end

  it 'setup docs using id' do
    Configuration.init
    Configuration.publish 'one', id: 'gdoc_id'
    Configuration.paths.should include('one')
    Configuration.properties('one')[:id].should eq('gdoc_id')
    Configuration.properties('one')[:type].should eq('gdoc')
  end



end
