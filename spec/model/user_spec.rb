require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "creates a new user" do
      user = User.create(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'User bio')
      expect(User.count).to eq(1)
      expect(user.name).to eq('John Doe')
      expect(user.photo).to eq('https://example.com/photo.jpg')
      expect(user.bio).to eq('User bio')
    end
  end
end
