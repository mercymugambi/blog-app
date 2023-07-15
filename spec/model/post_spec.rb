require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      user = User.create(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'User bio')
      post = Post.new(title: 'Hello', text: 'This is my post')
      post.user = user
      post.save

      expect(post.user).to eq(user)
    end
  end
end
