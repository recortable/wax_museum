require "wax_museum/version"
require 'yaml'

module WaxMuseum
  module Adapters
  end

  require 'wax_museum/configuration'
  require 'wax_museum/routes'
  require 'wax_museum/engine'
  require 'wax_museum/adapters/google_docs'

  def self.config(&block)
    Configuration.instance_eval(&block)
    Configuration.documents
  end

  def self.find(path)
    properties = Configuration.properties(path)
    raise ActiveRecord::RecordNotFound.new("[wax_museum] Document '#{path}' not found.") if properties.blank?
    Document.new(properties)
  end
end
