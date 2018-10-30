class Message < ApplicationRecord
  belongs_to :visitor

  validates :content, presence: true

  def self.matching_name_or_message search
    joins(:visitor).where('full_name LIKE ? or content LIKE ?', "%#{search}%", "%#{search}%")
  end

  def mark_read
    update(status: true) if status == false
  end
end