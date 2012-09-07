require File.join(File.dirname(__FILE__), '../../app/models/gdocstatic/static_page')
require 'minitest/autorun'

describe Gdocstatic::StaticPage do
  it 'has path and document_id' do
    page = Gdocstatic::StaticPage.new('path', 'gdoc_id')
    page.path.must_equal 'path'
    page.document_id.must_equal 'gdoc_id'
  end
end
