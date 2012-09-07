module Gdocstatic
  class Engine < ::Rails::Engine
    initializer 'load_default_configuration' do
      config_file = "#{Rails.root}/config/gdocstatic.yml"
      Configuration.setup(config_file) if File.exists?(config_file)
    end
  end
end
