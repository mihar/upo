# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

config.after_initialize do
  require 'application' unless Object.const_defined?(:ApplicationController)
  LoggedExceptionsController.class_eval do
    # set the same session key as the app
    session :session_key => '_zuo_session_id'
    
    # include any custom auth modules you need
    include AuthenticationSystem
    
    before_filter :authenticate_without_segment
  end
end