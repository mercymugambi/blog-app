class Like < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :user, foreign_key: 'author_id'

  after_save :likes_update

  private

  def likes_update
    post.increment!(:likes_counter)
  end
end
