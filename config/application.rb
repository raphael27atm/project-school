require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SchoolProject
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    config.responders.flash_keys = [ :notice, :failure ]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    config.time_zone = 'Brasilia'
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = :'pt-BR'
  
    config.generators do |g|
        g.stylesheets     false
        g.javascripts     false
        g.rspec           false
        g.helpers         false
        g.test            false
    end
    
    config.assets.paths << Rails.root.join('vendor', 'assets')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
