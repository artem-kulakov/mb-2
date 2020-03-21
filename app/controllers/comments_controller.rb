class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def like
    @comment_id = params[:comment]
    comment = Comment.find(@comment_id)

    if comment.likes.where(user_id: current_user.id).count < 1
      Like.create(
        user_id: current_user.id,
        comment_id: @comment_id,
        value: true
      )
    end

    @count = comment.reload.likes_count
  end

  def dislike
    @comment_id = params[:comment]
    comment = Comment.find(@comment_id)

    if comment.likes.where(user_id: current_user.id).count < 1
      Like.create(
        user_id: current_user.id,
        comment_id: @comment_id,
        value: false
      )
    end

    @count = comment.reload.dislikes_count
  end
end
