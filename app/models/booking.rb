class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :service_provider, class_name: 'User', foreign_key: 'service_provider_id'
  belongs_to :dog_owner, class_name: 'User', foreign_key: 'dog_owner_id'
end
