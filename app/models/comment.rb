class Comment < ApplicationRecord
  belongs_to :post, :counter_cache => true
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true

  scope :approved, -> {where status: true}

  def self.matching_name_or_message search
    joins(:visitor).where('full_name LIKE ? or message LIKE ?', "%#{search}%", "%#{search}%")
  end
end
