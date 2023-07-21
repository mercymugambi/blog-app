class UsersController < ApplicationController
  # GET /users or users.json
  def index; 
  @users = User.all
  end

  def show; end
end
