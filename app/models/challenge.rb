class Challenge < ApplicationRecord
  has_many :participations, dependent: :destroy
end
