module Spree
  class Slide < ActiveRecord::Base

    has_attached_file :image,
      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
      :url => '/spree/showcase/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/showcase/:id/:style/:basename.:extension'
    STORAGE_OPTIONS = { :storage => 'filesystem' }
    # Add S3 and Heroku support
    if Rails.env.production?
      if ENV['S3_KEY'] && ENV['S3_SECRET'] && ENV['S3_BUCKET']
        STORAGE_OPTIONS = {
          :storage => 's3',
          :s3_credentials => {
            :access_key_id     => ENV['S3_KEY'],
            :secret_access_key => ENV['S3_SECRET']
          },
          :bucket => ENV['S3_BUCKET']
        }
      elsif FileTest.exists?(Rails.root.join('config','s3.yml')) 
        STORAGE_OPTIONS = {
          :storage => 's3',
          :s3_credentials => Rails.root.join('config', 's3.yml')
        }
      else 
        raise("S3 Configuration not found") 
      end
    end

    attachment_definitions[:image] = (attachment_definitions[:image] || {}).merge(STORAGE_OPTIONS)
    
    default_scope order(:position) # Slides should always be ordered by position specified by user.
    scope :published, where(:published=>true)
    scope :no_slides, lambda {|num| limit(num)}
    attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
  end
end
