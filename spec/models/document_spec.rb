require 'spec_helper'

include WaxMuseum

describe Document do
  it 'has path and document id' do
    page = Document.new('path', 'gdoc_id')

    page.path.should eq('path')
    page.document_id.should eq('gdoc_id')
  end

end
