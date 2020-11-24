class ShipmentSerializer
  include FastJsonapi::ObjectSerializer

  attributes :airway_bill, :shipping_date, :shipping_notes

  has_many :shipment_items
end
