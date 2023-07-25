require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before do
    @user = User.create(
      name: 'John Doe',
      bio: 'A brief bio about John Doe',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo'
    )

    @post1 = @user.posts.create(title: 'Post 1', text: 'Content for Post 1')
    @post2 = @user.posts.create(title: 'Post 2', text: 'Content for Post 2')
    @post3 = @user.posts.create(title: 'Post 3', text: 'Content for Post 3')
    @post4 = @user.posts.create(title: 'Post 4', text: 'Content for Post 4')
    @post5 = @user.posts.create(title: 'Post 5', text: 'Content for Post 5')
  end

  scenario "displays user's profile picture, username, number of posts, and bio" do
    visit user_path(@user)

    expect(page).to have_selector("img[src$='https://unsplash.com/photos/F_-0BxGuVvo']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of Posts: 5")
    expect(page).to have_content(@user.bio)
  end

  scenario "displays user's first 3 posts" do
    visit user_path(@user)

    expect(page).to have_content(@post5.title)
    expect(page).to have_content(@post4.title)
    expect(page).to have_content(@post3.title)
    expect(page).not_to have_content(@post2.title)
    expect(page).not_to have_content(@post1.title)
  end

  scenario "clicking 'Show More' displays all posts by the user" do
    visit user_path(@user)

    click_link "Show More"
    expect(current_path).to eq(user_posts_path(@user))

    expect(page).to have_content(@post5.title)
    expect(page).to have_content(@post4.title)
    expect(page).to have_content(@post3.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post1.title)
    
  end
end
