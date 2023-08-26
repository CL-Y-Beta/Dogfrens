class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :service_provider
  belongs_to :dog_owner
end
