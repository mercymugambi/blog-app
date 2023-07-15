require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'New user', posts_counter: 1) }
  subject do
    Post.new(author: user, title: 'Nature', text: 'This is exciting!', likes_counter: 0, comments_counter: 0)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have comments_counter equal to 0' do
    expect(subject.comments_counter).to eq(0)
  end

  it 'should have likes_counter equal to 0' do
    expect(subject.likes_counter).to eq(0)
  end

  it 'title should not be greater than 250 characters' do
    post = Post.create(author: user, title: 'a' * 251, text: 'This is exciting!')
    expect(post).not_to be_valid
  end

  it 'return last five posts' do
    expect(subject.display_comments).to eq(subject.comments.order(updated_at: :desc).limit(5))
  end

  it 'increments the author\'s posts_counter after save' do
    expect { subject.save }.to change { user.reload.posts_counter }.by(1)
  end
end
