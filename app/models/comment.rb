class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :author, class_name: 'User'
    belongs_to :user, foreign_key: 'post_id'
end
