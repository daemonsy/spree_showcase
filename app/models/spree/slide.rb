class Spree::Slide < ActiveRecord::Base
  
  if ENV['S3_KEY']
    has_attached_file :image, 
                      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
                      :path => "assets/showcase/:id/:style/:basename.:extension",
                      :storage => "s3",
                      :s3_credentials => {
                        :access_key_id => ENV['S3_KEY'] || HEROKU_AWS_S3['access_key_id'],
                        :secret_access_key => ENV['S3_SECRET'] || HEROKU_AWS_S3['secret_access_key']
                      },
                      :bucket => ENV['S3_BUCKET'] || HEROKU_AWS_S3['bucket']
  else
    has_attached_file :image, 
                      :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                                :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]},
                      :url => '/spree/taxons/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/spree/taxons/:id/:style/:basename.:extension'
  end

  default_scope order(:position) # Slides should always be ordered by position specified by user.
  scope :published, where(:published=>true)
  scope :no_slides, lambda {|num| limit(num)}
  attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
end