class Shipment < ApplicationRecord
  belongs_to :service, :foreign_key => :service_code
  belongs_to :shipper
  belongs_to :consignee
  belongs_to :status

  has_many :shipment_items
  has_many :shipment_logs

  validates :airway_bill, :shipping_date, :shipping_notes, presence: true
end
