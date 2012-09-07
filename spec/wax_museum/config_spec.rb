require 'spec_helper'

include WaxMuseum

describe Configuration do
  it 'no setup' do
    Configuration.init
    Configuration.paths.should be_empty
  end

  it 'setup docs' do
    Configuration.doc 'one', gdoc_id: 'gdoc_id'
    Configuration.paths.should include('one')
  end
end
