class PostsController < ApplicationController
  # GET /posts or posts.json
  def index
    @user = User.find(params[:user_id])
    @all_posts = @user.posts.includes(:user, comments: :user)
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
