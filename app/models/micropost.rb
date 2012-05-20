class Micropost < ActiveRecord::Base

  attr_accessible :content, :liked, :flag, :tag, :to_guys
  validates :content, :presence => true, 
                      :length => { :maximum => 140 }
 


  # default_scope :order => 'comments_count DESC, created_at DESC'
  # scope :popular, where('comments_count DESC, created_at DESC')
  # scope :recent, where('created_at DESC')
  # scope :fagged, where(:flag != "0")
  # scope :for_guys, where(:toguys => "false")
  # scope :for_girls, where(:toguys => "true")

  # @microposts = Micropost.order('comments_count ASC').all

  has_many :comments
  # def self.feed(last)
  #   self.where("created_at < ? ", last).order('created_at desc').limit(5)
  # end
  
    def self.search(search, page)
      
      paginate :per_page => 5, :page => page,
                 :conditions => ['content like ?', "%#{search}%"], :order => 'comments_count DESC, created_at DESC'       
    
    end
    
  
end
