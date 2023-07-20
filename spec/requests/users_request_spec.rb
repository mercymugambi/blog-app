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
end
