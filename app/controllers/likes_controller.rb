class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to user_post_path(current_user, @post), notice: 'Like was successfully added.'
    else
      redirect_to user_post_path(current_user, @post), alert: 'Failed to add like.'
    end
  end
end
