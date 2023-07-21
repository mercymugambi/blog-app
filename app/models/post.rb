class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :user, foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_user_posts_counter
  after_destroy :decrement_user_posts_counter

  after_save :increment_user_posts_counter
  after_save :decrement_user_posts_counter

  def increment_user_posts_counter
    user.increment!(:posts_counter)
  end

  def decrement_user_posts_counter
    user.decrement!(:posts_counter)
  end

  def display_comments
    comments.order(created_at: :desc).limit(5)
  end
end
