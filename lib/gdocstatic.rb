require "gdocstatic/engine"
require 'yaml'

module Gdocstatic

  def self.find(path)
    document_id = Config.document_id(path)
    raise ActiveRecord::RecordNotFound.new("[gdocstatic] Page with id #{id} not found.") if document_id.blank?
    StaticPage.new(path, document_id)
  end

  module Config
    mattr_accessor :user
    @@user = 'admin'
    mattr_accessor :password
    @@password = 'secret'

    @@config = {}

    def self.setup(file = nil)
      @@config = HashWithIndifferentAccess.new(YAML.load(File.read(file))) 
    end

    def self.paths
      @@config[:documents].keys
    end

    def self.document_id(path)
      @@config[:documents][path]
    end
  end

  module Routes 
    def self.draw(options)
      options.reverse_merge! on: '', reload_action: 'reload'

      Rails.application.routes.draw do
        Config.paths.each do |path|
          match "#{options[:on]}/#{path}", controller: 'gdocstatic/static_pages',
          action: 'show',  id: path.to_s.dup,
          as: "#{path}_static_page", format: false

          if options[:reload_action].present?
            match "#{options[:on]}/#{path}/#{options[:reload_action]}", 
            controller: 'gdocstatic/static_pages', action: 'clear_cache', id: path.to_s.dup,
            format: false
          end
        end

      end
    end
  end
end
