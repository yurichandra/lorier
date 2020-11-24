class Fare < ApplicationRecord
  validates :origin_id, :destination_id, :service_code, :amount, presence: true
end