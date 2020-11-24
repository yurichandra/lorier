class AirwayBillSerializer
  include FastJsonapi::ObjectSerializer

  attributes :service_code, :airway_bill, :shipping_date, :receive_date

  belongs_to :status
end