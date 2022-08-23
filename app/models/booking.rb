class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_one :category, through: :show


  validates :date, :address, presence: true
end
