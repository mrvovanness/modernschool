class AddDocumentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :document, :string
  end
end
