require 'spec_helper'

include Gdocstatic

describe Configuration do
  it 'setup defaults' do
    Configuration.setup
    Configuration.paths.should be_empty
  end

  it 'setup by keys' do
    Configuration.setup({ documents: {a: 'gdoc_a'} })
    Configuration.paths.should include(:a)
  end

end
