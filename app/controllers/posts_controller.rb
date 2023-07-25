class PostsController < ApplicationController
  before_action :set_user, only: %i[index show new create]
  # GET /posts or posts.json
  def index
    @user = User.find(params[:user_id])
    @all_posts = @user.posts.includes(:user, comments: :user)
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = @user.posts.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      puts @post.errors.full_messages
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
