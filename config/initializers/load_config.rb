
config_file = "#{Rails.root}/config/gdocstatic.yml"
Gdocstatic::Config.setup(config_file) if File.exists?(config_file)
