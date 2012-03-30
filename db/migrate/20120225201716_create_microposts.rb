class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.boolean :to_guys
      t.string :tag
      t.boolean :approved
      t.string :content
      t.integer :flag
      t.integer :liked

      t.timestamps
    end
  end
end
