Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  Dotenv::Railtie.load

  config.consider_all_requests_local = true
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  # Enable/disable caching and asset debugging when tmp/caching-dev.txt exists
  # used to test how fast the application will perform in production.
  # delete tmp/caching-dev.txt when not doing speed tests.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_classes = true
    config.eager_load = true
    config.assets.debug = false
    config.assets.js_compressor = :uglifier
    config.assets.css_compressor = :sass
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_classes = false
    config.eager_load = false
    config.assets.debug = true
    config.cache_store = :null_store
  end

  # ActionMailer Config
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host:'localhost', port: '3000' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default charset: "utf-8"
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "example.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV['GMAILU'],
    password: ENV['GMAILP']
  }

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  # Suppress logger output for asset requests.
  config.assets.quiet = false

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
