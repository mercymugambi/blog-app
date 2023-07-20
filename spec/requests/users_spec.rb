describe "GET /show" do
    it "renders a successful response" do
        user =User.create! Valid_attributes
        get user_url(user)
        expect(response).to be_successful
    end
end