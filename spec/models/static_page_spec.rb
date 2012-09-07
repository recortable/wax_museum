require 'spec_helper'

include Gdocstatic

describe StaticPage do
  it 'has path and document id' do
    page = StaticPage.new('path', 'gdoc_id')

    page.path.should eq('path')
    page.document_id.should eq('gdoc_id')
  end

end
