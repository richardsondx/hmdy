class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :micropost, :counter_cache => true
  
  validates :body, :presence => true, 
                      :length => { :maximum => 140 }
  
  
  # default_scope :order => 'comments.created_at DESC'
end
