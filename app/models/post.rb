class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', counter_cache: true

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_user_posts_counter
  after_destroy :decrement_user_posts_counter

  def increment_user_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_posts
    user.posts.order(created_at: :desc).limit(3)
  end

  private

  def decrement_user_posts_counter
    user.decrement!(:posts_counter)
  end
end
