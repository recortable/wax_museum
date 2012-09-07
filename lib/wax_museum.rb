require "wax_museum/version"
require 'yaml'

module WaxMuseum
  require 'wax_museum/configuration'
  require 'wax_museum/routes'
  require 'wax_museum/engine'

  def self.config(&block)
    Configuration.instance_eval(&block)
  end

  def self.find(path)
    document_id = Configuration.document_id(path)
    raise ActiveRecord::RecordNotFound.new("[wax_museum] Page with id #{path} not found.") if document_id.blank?
    Document.new(path, document_id)
  end
end
