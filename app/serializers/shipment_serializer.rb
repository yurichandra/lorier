class ShipmentSerializer
  include FastJsonapi::ObjectSerializer

  attributes :airway_bill, :shipping_date, :shipping_notes, :shipment_items
end