# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      CommentMailer.notify.deliver_now
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
