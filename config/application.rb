require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoCBlog
  class Application < Rails::Application

    config.generators do |g|
     g.test_framework  nil, :fixture => false
    end
    
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    config.active_record.raise_in_transactional_callbacks = true
  end
end
