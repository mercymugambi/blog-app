require 'rails_helper'

RSpec.feature 'Users Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'User 1')
    @user2 = User.create(name: 'User 2')

    @user1.posts.create(title: 'Post 1', text: 'Content for Post 1')
    @user1.posts.create(title: 'Post 2', text: 'Content for Post 2')
    @user2.posts.create(title: 'Post 3', text: 'Content for Post 3')
    @user2.posts.create(title: 'Post 4', text: 'Content for Post 4')
    @user2.posts.create(title: 'Post 5', text: 'Content for Post 5')

    @user1.update(photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2.update(photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
  end

  scenario 'displays all users with their number of posts and profile pictures' do
    visit users_path

    expect(page).to have_content(@user1.name)
    expect(page).to have_content('Posts: 2')
    expect(page).to have_selector("img[src$='https://unsplash.com/photos/F_-0BxGuVvo']")

    expect(page).to have_content(@user2.name)
    expect(page).to have_content('Posts: 3')
    expect(page).to have_selector("img[src$='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'clicking on a user redirects to their show page' do
    visit users_path

    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))
  end
end
