class Post < ApplicationRecord

  belongs_to :post, class_name: 'User'
  belongs_to :user, foreign_key: 'author_id'
end
