class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author_id
      t.string :title
      t.string :text
      t.string :comments_counter
      t.integer :likes_counter
      t.timestamps
    end
  end
end
