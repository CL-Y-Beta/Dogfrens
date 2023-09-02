class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model

  pg_search_scope :search_by_various_fields,
    against: [ :title, :description, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
