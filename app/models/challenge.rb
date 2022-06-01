class Challenge < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_one_attached :photo


  validates :title, :description, :start_date, :frequency, presence: true
  # validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
end
