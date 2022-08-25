class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_one :category, through: :show


  validates :start_time, :address, presence: true

end
