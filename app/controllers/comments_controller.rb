class CommentsController < ApplicationController
  def like
    @comment_id = params[:comment]

    Like.create(
      user_id: current_user.id,
      comment_id: @comment_id,
      value: true
    )

    comment = Comment.find(@comment_id)
    @count = comment.likes_count
  end

  def dislike
    @comment_id = params[:comment]

    Like.create(
      user_id: current_user.id,
      comment_id: @comment_id,
      value: false
    )

    comment = Comment.find(@comment_id)
    @count = comment.dislikes_count
  end
end
