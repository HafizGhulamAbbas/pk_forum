class Mcq < ApplicationRecord
    validates :subject, presence: true
    validates :question, presence: true
    validates :optionA, presence: true
    validates :optionB, presence: true
    validates :optionC, presence: true
    validates :optionD, presence: true
    validates :correctOption, presence: true
    before_save :downcase_fields

    def self.matching_subject search
        Mcq.where('subject ILIKE ?', "%#{search}%")
    end

    def downcase_fields
        self.correctOption.upcase!
    end

end
