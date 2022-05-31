class Challenge < ApplicationRecord
  has_many :participations, dependent: :destroy

  validates :title, :description, :start_date, :frequency, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
  validates :description, length: { minimum: 10 }
end
