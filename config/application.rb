require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module Nbinvitational
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.vire_spec false
      generate.helper_spec false
      generate.routing_spec false
      generate.controller_spec false
      generate.system_tests false
    end
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %w[:get :post :put :delete],
                 expose: %w[access-token expiry token-type uid client],
                 max_age: 0
      end
    end
    config.api_only = true
  end
end
