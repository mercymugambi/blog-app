require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to a post' do
      post = Post.create(author_id: 1, title: 'Post 1', text: 'This is post 1')
      like = Like.new
      like.post = post
      like.save

      expect(like.post).to eq(post)
    end

    it 'belongs to a user' do
      user = User.create(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'User bio')
      like = Like.new
      like.user = user
      like.save

      expect(like.user).to eq(user)
    end
  end
end
