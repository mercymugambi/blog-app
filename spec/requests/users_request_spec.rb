require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'responds with HTTP success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('Hello! This a list of users! index')
    end
  end

  # tests for users show
  describe 'GET #show' do
    let(:user) { User.create(name: 'Mercy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'tester') }

    it 'responds with HTTP success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end
    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include('Oooh yeah! users show')
    end
  end
end
