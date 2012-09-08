require 'active_support/core_ext/hash/indifferent_access'

module WaxMuseum
  module Configuration
    def self.init
      @@documents = HashWithIndifferentAccess.new
    end

    def self.publish(path, data)
      if data.is_a?(String)
        @@documents[path] = { path: path, id: data, type: 'gdoc' }
      elsif data.is_a?(Hash)
        @@documents[path] = { path: path,
                              id: data.fetch(:id),
                              type: data.fetch(:type, 'gdoc') }
      else
        throw Exception.new("Can't publish #{path}: unknown data (#{data})")
      end
    end

    def self.paths
      @@documents.keys
    end

    def self.properties(path)
      @@documents[path]
    end

    mattr_accessor :documents
    @@documents = HashWithIndifferentAccess.new
  end
end
