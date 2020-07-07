# frozen_string_literal: true

class PostMailer < ApplicationMailer
  def send_most_favorited_yesterday(user, posts)
    @posts = posts
    mail to: user.email
  end
end
