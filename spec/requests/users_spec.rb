require 'rails_helper'

describe "GET /show" do
  it "renders a successful response" do
    user = User.create!(name: "Mercy", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Lecturer")
    get user_url(user)
    expect(response).to be_successful
  end
end
