require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Shop
  class Application < Rails::Application
    config.i18n.default_locale = :ja
  end
end
