require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Timetracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.autoload_paths << Rails.root.join("lib")
    
    config.time_zone = "Mountain Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
