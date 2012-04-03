class Micropost < ActiveRecord::Base
  attr_accessible :content, :liked, :flag, :tag, :to_guys
  validates :content, :presence => true, 
                      :length => { :maximum => 140 }
                      
  default_scope :order => 'microposts.created_at DESC'
  

  
end
