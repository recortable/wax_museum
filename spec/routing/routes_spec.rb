require 'spec_helper'

include Gdocstatic

describe 'routes' do

  context 'using prefix' do
    before(:all) do
      Configuration.setup( {documents: {one: 'one'} } )
      Routes.draw(on: 'info')
    end

    it "should generate normal route with id" do
      one_static_page_path.should eq('/info/one')
    end
  end
end
