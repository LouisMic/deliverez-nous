class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user

  validates :date, :address, presence: true
end
