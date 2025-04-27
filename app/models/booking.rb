class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "Cannot be earlier than today!") if date.present? && date < Date.today
  end
end
