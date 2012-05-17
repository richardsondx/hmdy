class Micropost < ActiveRecord::Base

  attr_accessible :content, :liked, :flag, :tag, :to_guys
  validates :content, :presence => true, 
                      :length => { :maximum => 140 }
 
  default_scope :order => 'comments_count DESC, created_at DESC'

  # @microposts = Micropost.order('comments_count ASC').all

  has_many :comments
  # def self.feed(last)
  #   self.where("created_at < ? ", last).order('created_at desc').limit(5)
  # end
end
