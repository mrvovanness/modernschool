class AddColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.text :biography
      t.text :about
      t.string :avatar
    end
  end
end
