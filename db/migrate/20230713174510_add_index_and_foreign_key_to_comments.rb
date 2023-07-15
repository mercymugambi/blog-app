class AddIndexAndForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_foreign_key :comments, :posts, column: :post_id
    add_foreign_key :comments, :users, column: :author_id
  end
end
