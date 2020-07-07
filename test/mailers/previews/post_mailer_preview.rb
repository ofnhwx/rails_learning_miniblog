# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def send_most_favorited_yesterday
    user = User.first
    posts = Post.most_favorited_yesterday
    PostMailer.send_most_favorited_yesterday(user, posts)
  end
end
