require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'belongs to a post' do
      post = Post.create(author_id: 1, title: 'Post 1', text: 'This is post 1')
      comment = Comment.new
      comment.post = post
      comment.save

      expect(comment.post).to eq(post)
    end

    it 'belongs to a user' do
      user = User.create(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'User bio')
      comment = Comment.new
      comment.user = user
      comment.save

      expect(comment.user).to eq(user)
    end
  end
end
