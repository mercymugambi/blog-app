class AddIndexToLikesOnAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :author_id
    add_index :likes, :post_id
    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end
