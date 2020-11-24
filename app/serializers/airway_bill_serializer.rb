class AirwayBillSerializer
  include FastJsonapi::ObjectSerializer

  attributes :service_code, :airway_bill, :shipping_date, :receive_date

  attributes :status do |shipment|
    {
      id: shipment.status.id,
      name: shipment.status.name
    }
  end

  attributes :shipment_logs, :consignee, :shipper, if: Proc.new { |_record, params|
    params && params[:action] == 'show'
  }
end