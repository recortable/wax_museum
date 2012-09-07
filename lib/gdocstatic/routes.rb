module Gdocstatic
  module Routes 
    def self.draw(options = {})
      options.reverse_merge! on: '', reload_action: 'reload'

      Rails.application.routes.draw do
        Configuration.paths.each do |path|
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
