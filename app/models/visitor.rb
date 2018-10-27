class Visitor < ApplicationRecord
  has_many :notifications, as: :notifiable
  has_many :comments
  has_many :messages
end
