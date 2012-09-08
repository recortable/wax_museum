# encoding: UTF-8

require 'open-uri'

module WaxMuseum
  module Gateway
    def self.open(url)
      Kernel.open(url).read
    end

  end


  module Adapters
    @@adapters = {}

    def self.register(type, adapter)
      @@adapters[type.to_sym] = adapter
    end

    def self.fetch(type)
      @@adapters[type.to_sym]
    end
  end
end

