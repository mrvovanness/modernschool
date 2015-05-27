class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :lesson_id
      t.index :lesson_id
      t.string :commenter_name
      t.text :body

      t.timestamps null: false
    end
  end
end
