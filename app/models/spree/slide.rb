module Spree
  class Slide < ActiveRecord::Base

    has_attached_file :image,
      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
      :url => '/spree/showcase/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension'

    # Add S3 and Heroku support
    s3_options = if ENV['S3_KEY'] && ENV['S3_SECRET'] && ENV['S3_BUCKET']
      {
        :storage => 's3',
        :s3_credentials => {
          :access_key_id     => ENV['S3_KEY'],
          :secret_access_key => ENV['S3_SECRET']
        },
        :bucket => ENV['S3_BUCKET']
      }
    elsif (s3_config_file = Rails.root.join('config','s3.yml')).exist?
      {
        :storage => 's3',
        :s3_credentials => s3_config_file
      }
    else
      { :storage => 'filesystem' }
    end

    attachment_definitions[:image] = (attachment_definitions[:image] || {}).merge(s3_options)

    default_scope order(:position) # Slides should always be ordered by position specified by user.
    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
  end
end
