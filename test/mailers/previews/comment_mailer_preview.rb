# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/notify
  def notify
    CommentMailer.notify(Comment.first)
  end
end
