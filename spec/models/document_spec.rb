require 'spec_helper'

include WaxMuseum

describe Document do
  it 'has path and id' do
    doc = Document.new(path: 'path', id: 'id')
    doc.path.should eq('path')
    doc.id.should eq('id')
  end
end
