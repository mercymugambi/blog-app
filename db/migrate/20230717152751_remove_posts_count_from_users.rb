class RemovePostsCountFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :posts_count
  end
end