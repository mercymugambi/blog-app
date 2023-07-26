require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Post Pagination', type: :feature do
  before do
    @user = User.create(
      name: 'Tom',
      posts_counter: 3,
      photo: 'https://pic.com',
      bio: 'Project manager'
    )

    subject = Post.new(
      author_id: @user.id,
      title: 'Post 2',
      text: 'Text for Post 2',
      comments_counter: 2,
      likes_counter: 2
    )
    subject.save

    10.times do |i|
      @user.posts.create(
        title: "Post #{i + 3}",
        text: "Text for Post #{i + 3}",
        comments_counter: 2,
        likes_counter: 2
      )
    end
  end

  describe 'Post index page' do
    it 'shows a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user.id)

      expect(page).to have_selector('div.pagination')
    end
  end
end
