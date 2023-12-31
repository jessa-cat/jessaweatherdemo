require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jessaweatherdemo
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
    OpenWeather::Client.configure do |config|
      config.api_key = "03dd5afc8172e08b36aeded41f64eb4a" # Bad!! API keys, secrets, etc, should be injected from the env.  That's beyond this demo's scope
      config.user_agent = "OpenWeather Ruby Client/1.0"
      config.units = "imperial"
    end
  end
end
