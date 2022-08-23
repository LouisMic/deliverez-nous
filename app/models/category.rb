class Category < ApplicationRecord
  has_many :shows
  has_many :bookings, through: :shows

  validates :name, presence: true
end
