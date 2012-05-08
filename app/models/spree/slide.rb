class Spree::Slide < ActiveRecord::Base
  
  
  has_attached_file :image, :styles=>{:thumb=> ["220x110#"]}
  
  default_scope order(:position) # Slides should always be ordered by position specified by user.
  scope :published, where(:published=>true)
  scope :last_five, limit(5)
  attr_accessible :name, :body, :target_url, :published, :image, :thumbnail_message
end