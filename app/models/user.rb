# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[a-zA-Z]+\z/ },
                       length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  def follow(other)
    following << other
  end

  def unfollow(other)
    following.delete other
  end

  def following?(other)
    following.include? other
  end

  def like(post)
    favorite_posts << post
  end

  def unlike(post)
    favorite_posts.destroy post
  end

  def like?(post)
    favorite_posts.include? post
  end

  def feed
    Post.where('user_id = :current_user_id OR user_id IN (:following_ids)',
               current_user_id: id,
               following_ids: active_relationships.pluck(:followed_id))
  end
end
