class AirwayBillSerializer
  include FastJsonapi::ObjectSerializer

  attributes :service_code, :airway_bill, :shipping_date, :receive_date

  belongs_to :status

  attributes :shipment_logs, :consignee, :shipper, if: Proc.new { |_record, params|
    params && params[:action] == 'show'
  }
end