require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LauraRoblesWebapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # to avoid CSRF errors when receiving requests from https domain
    config.action_controller.default_protect_from_forgery = true
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'https://lauraroblesmusic.com',
    }
    config.action_controller.default_url_options = { host: 'https://lauraroblesmusic.com' }

    config.i18n.available_locales = [:en, :de, :es]
    config.i18n.default_locale = :en
  end
end
