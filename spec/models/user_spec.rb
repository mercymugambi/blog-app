require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Henry', photo: 'photo1', bio: 'First photo', posts_counter: 1) }

  before { subject.save }

  it 'name should be present' do
    expect(subject).to be_valid
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be zero or more' do
    expect(subject.posts_counter).to be_a(Integer)
    expect(subject.posts_counter).to be >= 0
  end

  it 'return last three posts' do
    expect(subject.most_recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
  end
end
