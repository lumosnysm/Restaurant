require_relative "boot"
require "rails/all"
require "csv"

Bundler.require(*Rails.groups)

module Restaurant
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :en
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
