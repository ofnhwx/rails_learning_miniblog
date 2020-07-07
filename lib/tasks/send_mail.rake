# frozen_string_literal: true

namespace :send_mail do
  desc '前日の「いいね」数ランキング10位までの投稿を通知します'
  task most_favorited_posts_yesterday: :environment do
    posts = Post.most_favorited_yesterday
    if posts.empty?
      p '前日に「いいね」された投稿がありません.'
    else
      User.all.each do |user|
        PostMailer.send_most_favorited_yesterday(user, posts).deliver_now
      end
    end
  end
end
