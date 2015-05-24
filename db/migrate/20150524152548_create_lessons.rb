class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :course_id
      t.index :course_id

      t.timestamps null: false
    end
  end
end
