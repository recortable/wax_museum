require "gdocstatic/version"
require 'yaml'

module Gdocstatic
  require 'gdocstatic/configuration'
  require 'gdocstatic/routes'
  require 'gdocstatic/engine'

  def self.find(path)
    document_id = Configuration.document_id(path)
    raise ActiveRecord::RecordNotFound.new("[gdocstatic] Page with id #{id} not found.") if document_id.blank?
    StaticPage.new(path, document_id)
  end


end
