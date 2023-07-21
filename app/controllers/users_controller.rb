class UsersController < ApplicationController
  # GET /users or users.json
  def index; 
  @users = User.all
  end

  def show; 
  @user = User.find(params[:id])
  @user_posts = @user.posts
  end
end
