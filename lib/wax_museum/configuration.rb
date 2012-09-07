require 'active_support/core_ext/hash/indifferent_access'

module WaxMuseum
  module Configuration
    def self.init
      @@documents = HashWithIndifferentAccess.new
    end

    def self.doc(path, properties = {})
      properties.reverse_merge! path: path
      @@documents[path] = properties
    end

    def self.paths
      @@documents.keys
    end

    def self.document_id(path)
      @@documents[path]
    end

    mattr_accessor :documents
    @@documents = HashWithIndifferentAccess.new
  end
end
