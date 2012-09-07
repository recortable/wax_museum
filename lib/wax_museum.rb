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
    properties = Configuration.properties(path)
    raise ActiveRecord::RecordNotFound.new("[wax_museum] Document '#{path}' not found.") if properties.blank?
    Document.new(properties)
  end
end
