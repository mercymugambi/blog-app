require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    let(:user) { User.create(name: "Mercy", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "tester") }
    let(:post) { Post.create(author_id: Osugo.id, title: 'Coding', text: 'ooooh Rails really?') }
  
    describe 'GET #index' do
      it 'responds with HTTP success' do
        get user_posts_path(user)
        expect(response).to have_http_status(:success)
      end
    end
    it 'renders the index template' do
        get user_posts_path(user)
        expect(response).to render_template(:index)
    end
end