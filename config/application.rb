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
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: ['assets', 'tasks'])

    config.time_zone = "America/Sao_Paulo"

    config.active_job.queue_adapter = :sidekiq

    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = %i[pt-BR en]
    config.i18n.default_locale = :'pt-BR'
    config.i18n.fallbacks = true

    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]

    config.generators.system_tests = nil

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       controller_specs: true
    end
  end
end
