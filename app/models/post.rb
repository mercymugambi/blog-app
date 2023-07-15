class Post < ApplicationRecord

  belongs_to :author, class_name: 'User'
  belongs_to :user, foreign_key: 'author_id'
end
