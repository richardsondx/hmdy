class AddCommentsCountToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :comments_count, :integer, :default => 0, :null => false
    
    Micropost.reset_column_information
      Micropost.find(:all).each do |p|
        Micropost.update_counters p.id, :comments_count => p.comments.length
      end
    
  end
end
