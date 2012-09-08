
class WaxMuseum::Document
  attr_accessor :path, :id, :type

  def initialize(properties)
    @type = properties.fetch(:type)
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
    ::WaxMuseum::Adapters.fetch(@type).open(@id)
  end

end

