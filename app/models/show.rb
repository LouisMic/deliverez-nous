class Show < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  validates :name, :description, :company, :location_center, :location_radius, :price, presence: true
  geocoded_by :location_center
  after_validation :geocode, if: :will_save_change_to_location_center?

  def self.available_shows(date)
    @shows.select do |show|
      show.bookings.where('date != ?', date)
    end
  end
end
