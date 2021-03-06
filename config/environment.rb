# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.action_controller.session = {
    :session_key => '_zuo_session',
    :secret      => '8fe8d0dc89813aa8e2b2276e754b740744d141076d0b06acaf8ae407bb64d85290225cc02710e8546c72a6804dd2fb1cb014e224d25b195a24d01f4f0baf2965'
  }
end
