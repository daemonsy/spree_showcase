class Spree::Slide < ActiveRecord::Base
  
  
  has_attached_file :image, :styles=>{:thumb=> ["#{SpreeShowcase::Config.thumbnail_style}"],
                                      :showcase=> ["#{SpreeShowcase::Config.showcase_style}"]} # Thumbnail Style is a config setting.
  
  default_scope order(:position) # Slides should always be ordered by position specified by user.
  scope :published, where(:published=>true)
  scope :no_slides, lambda {|num| limit(num)}
  attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
end