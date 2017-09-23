require_relative 'boot'

require 'rails/all'
# require 'aws-sdk'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Guidance
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    config.paperclip_defaults = {
      :storage => :s3,
      :path => ":class/:attachment/:id/:style.:extension",
      :s3_credentials => {
        :bucket => ENV["s3_bucket"],
        :access_key_id => ENV["s3_access_key_id"],
        :secret_access_key => ENV["s3_secret_access_key"],
        :s3_region => ENV["s3_region"],
        :s3_host_name => "#{ENV['s3_bucket']}.s3.amazonaws.com",
        :url => ":s3_host_name"
      }
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end



# http://guidance-dev.s3.amazonaws.com/projects/images/000/000/008/original/my_cat.jpg?1506028625
#
# guidance-dev.s3.amazonaws.com/guidance-dev/projects/images/000/000/012/original/Me_and_Clark.jpg?1506038059
