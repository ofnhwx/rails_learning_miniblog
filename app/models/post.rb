# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  mount_uploader :image, ImageUploader

  def self.most_favorited_yesterday
    most_favorited_by_day(Time.zone.now - 1.day)
  end

  def self.most_favorited_by_day(date)
    start_date = date.change(hour: 0)
    end_date = start_date + 1.day
    unscope(:order)
      .joins(:favorites)
      .select('posts.*, COUNT(favorites.id) AS favorites_count')
      .group('posts.id')
      .where('favorites.created_at >= ? AND favorites.created_at < ?', start_date, end_date)
      .order(favorites_count: :desc)
  end
end
