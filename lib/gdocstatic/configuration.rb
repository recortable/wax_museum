module Gdocstatic
  module Configuration
    def self.setup(source = nil)
      if source.is_a?(String)
        @@config = HashWithIndifferentAccess.new(YAML.load(File.read(source)))
      elsif source.is_a?(Hash)
        @@config = source
      else
        @@config = {documents: {} }
      end
    end

    def self.paths
      @@config[:documents].keys
    end

    def self.document_id(path)
      @@config[:documents][path]
    end
  end
end
