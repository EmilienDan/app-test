class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :hotel_name, presence: true
  validates :description, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :location, presence: true
end
