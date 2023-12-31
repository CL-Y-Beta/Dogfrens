class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # Devise setup and other code...
  has_one_attached :profile_photo
  has_many :bookmarks
  has_many :listings, dependent: :destroy
  has_many :service_provider_bookings, class_name: 'Booking', foreign_key: 'service_provider_id', dependent: :destroy
  has_many :dog_owner_bookings, class_name: 'Booking', foreign_key: 'dog_owner_id', dependent: :destroy
end
