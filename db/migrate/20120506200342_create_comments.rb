class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :micropost_id
      t.string :body
      t.references :micropost

      t.timestamps
    end
  end
end
