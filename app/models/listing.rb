class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
end
