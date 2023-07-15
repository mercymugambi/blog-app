class Comment < ApplicationRecord
    belongs_to :post, foreign_key: 'post_id'
    belongs_to :user, foreign_key: 'author_id'
  end
  