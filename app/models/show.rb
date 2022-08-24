class Show < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  validates :name, :description, :company, :location_center, :location_radius, :price, presence: true
end
