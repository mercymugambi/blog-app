require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'New user', posts_counter: 1) }
  let(:post) do
    Post.new(user:, title: 'Nature', text: 'This is exciting!', likes_counter: 0, comments_counter: 0)
  end
  subject { Like.new(post:, user:) }
  before { subject.save }

  it 'method update_likes_counter increments likes_counter by 1' do
    expect { subject.send(:likes_update) }.to change { post.reload.likes_counter }.by(1)
  end
end
