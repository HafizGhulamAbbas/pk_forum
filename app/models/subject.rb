class Subject < ApplicationRecord
  belongs_to :group, optional: true
end
