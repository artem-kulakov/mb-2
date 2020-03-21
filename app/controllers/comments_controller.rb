class CommentsController < ApplicationController
  def like
    Like.create(
      user_id: current_user.id,
      comment_id: params[:comment],
      value: true
    )
  end

  def dislike
    Like.create(
      user_id: current_user.id,
      comment_id: params[:comment],
      value: false
    )
  end
end
