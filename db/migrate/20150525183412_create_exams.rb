class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :user_id
      t.index :user_id

      t.timestamps null: false
    end
  end
end
