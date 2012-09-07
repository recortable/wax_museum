require 'spec_helper' 

include WaxMuseum::Adapters

describe GoogleDocs do

  it 'generates url from id' do
    GoogleDocs.url_for('the_id').should == 'https://docs.google.com/document/pub?id=the_id'
  end

  it 'retrieves title' do
    doc = GoogleDocs.new('<html><head><title>The title</title></head></html>')
    doc.title.should == 'The title'
  end

  it 'retrieves body' do
    doc = GoogleDocs.new('<html><body><div id="contents">The body</div></body></html>')
    doc.body.should == '<div id="contents">The body</div>'
  end

end
