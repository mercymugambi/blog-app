# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
    def create
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = @user
  
      if @comment.save
        redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
      else
        redirect_to user_post_path(@user, @post), alert: 'Failed to create comment.'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  