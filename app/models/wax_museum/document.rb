# encoding: UTF-8
require 'open-uri'

class WaxMuseum::Document
  attr_accessor :path, :id, :type

  def initialize(properties)
    @type = :gdoc
    @path = properties.fetch(:path)
    @id = properties.fetch(:id)
  end

  def title
    @doc ||= fetch_document
    @title ||= @doc.title
  end

  def body
    @doc ||= fetch_document
    @body || @doc.body
  end

  def cache_key
    "#{self.path}-static_page" 
  end

  protected
  def fetch_document
    url = ::WaxMuseum::Adapters::GoogleDocs.url_for(@id)
    ::WaxMuseum::Adapters::GoogleDocs.new(open(url).read)
  end

end

