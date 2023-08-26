class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
end
