class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_one :category, through: :show


  validates :date, :address, presence: true
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
