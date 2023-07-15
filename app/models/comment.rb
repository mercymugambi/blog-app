class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :comments_update

  private

  def comments_update
    post.increment!(:comments_counter)
  end
end
