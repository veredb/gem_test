require File.expand_path('../boot', __FILE__)

require 'rails/all'
#require(File.join("/Users/veredbauer/.rvm/gems/ruby-1.9.3-p448/bin/rails", "lib", "pg_data_encoder.rb"))
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)
#config.eager_load_paths += Dir["#{config.root}/lib/pg_data_encoder.rb"]
module Ppp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
      config.autoload_paths += Dir["#{config.root}/lib/pg_data_encoder.rb"]
      config.autoload_paths += Dir["#{config.root}/app/models/exam.rb/"]
  end
end
