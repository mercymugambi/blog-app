class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :user, foreign_key: 'author_id'

  after_save :comments_update

  private

  def comments_update
    post.increment!(:comments_counter)
  end
end
