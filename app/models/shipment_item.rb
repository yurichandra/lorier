class ShipmentItem < ApplicationRecord
  belongs_to :shipment

  validates :description, :width, :length, :height, presence: true
end
