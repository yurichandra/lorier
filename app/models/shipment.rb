class Shipment < ApplicationRecord
  belongs_to :services, :foreign_key => :service_code
  belongs_to :shipper
  belongs_to :consignee
  belongs_to :status

  has_many :shipment_items

  validates :airway_bill, :shipping_date, :shipping_notes, presence: true
end
