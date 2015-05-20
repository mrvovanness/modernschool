class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.index :user_id
      t.string :title, null: false
      t.text :body, null: false
    end
  end
end
