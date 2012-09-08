require 'spec_helper'

include WaxMuseum

describe Document do
  it 'has path, type and id' do
    doc = Document.new(path: 'path', id: 'id', type: 'type')
    doc.path.should eq('path')
    doc.id.should eq('id')
    doc.type.should eq('type')
  end
end
