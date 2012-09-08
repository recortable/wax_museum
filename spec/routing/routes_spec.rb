require 'spec_helper'

include WaxMuseum

describe 'routes' do

  context 'using prefix' do
    before(:all) do
      WaxMuseum.config do
        publish 'one', 'id'
      end
      Routes.draw(on: 'info')
    end

    it "should generate normal route with id" do
      one_static_page_path.should eq('/info/one')
    end
  end
end
