class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[a-zA-Z]+\z/ },
                       length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }
end
