class Show < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :name, :description, :company, :location_center, :location_radius, :price, presence: true
end
