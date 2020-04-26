# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  def notify(comment)
    @greeting = 'Hi'
    @comment = comment
    mail to: comment.post.user.email
  end
end
