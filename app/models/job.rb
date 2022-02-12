class Job < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :qualification, presence: true
  validates :eligibility, presence: true
 

end
