class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
