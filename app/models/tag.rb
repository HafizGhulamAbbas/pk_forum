class Tag < ApplicationRecord
  has_many :posts, through: :post_tags
end
