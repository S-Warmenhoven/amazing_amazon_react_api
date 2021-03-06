require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AmazingAmazon
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # This tells Rails' ActiveJob to use the gem "delayed_job"
    # to manage our job queue which will use a table in our
    # database
    config.active_job.queue_adapter = :delayed_job

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins("localhost:5500", "127.0.0.1:5500", "127.0.0.1:3000", "localhost:3000", "127.0.0.1:3434", "localhost:3434")
        #allow access to only paths that begin with /api/
        resource '/api/*',
        #this allows all http headers to be sent 
        headers: :any,
        # allows sharing of cookies for CORS requests made to this resource
        credentials: true,
        # define the http verbs which are allowed in a request
        methods: [:get, :post, :delete, :patch, :put, :options]
      end
    end
    
  end
end
