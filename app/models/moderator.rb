class Moderator < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :full_name, presence: true
  validates :user_name, presence: true, format: {with: /@/, message: 'is not valid'}
  validates :password, presence: true
end