class ShipmentCreateForm
  include ActiveModel::Model

  attr_accessor :shipment

  def initialize(shipment, params)
    @shipment = shipment
    @params = params
  end

  def save
    ActiveRecord::Base.transaction do
      store_shipment

      return false if invalid?
    end

    true
  end

  def invalid?
    valid? && @shipment.valid?

    errors.merge! @shipment.errors
    errors.present?
  end

  private

  def store_shipment
    shipper = find_shipper
    consignee = find_consignee

    @shipment.assign_attributes({
                                  airway_bill: generate_airway_bill(shipper),
                                  amount: total_fare(shipper.district_id, consignee.district_id),
                                  status_id: Status::STATUSES[:'On Process']
                                })

    @shipment.shipment_logs.build(logs_param)
    handle_shipping_items

    @shipment.save
  end

  def find_shipper
    Shipper.find(@params[:shipper_id])
  end

  def find_consignee
    Consignee.find(@params[:consignee_id])
  end

  def generate_airway_bill(shipper)
    AirwayBill::GeneratorService.new(
      service_code: @params[:service_code],
      district_id: shipper.district_id
    ).perform
  end

  def total_fare(origin_id, destination_id)
    Fare.find_by!(
      service_code: @params[:service_code],
      origin_id: origin_id,
      destination_id: destination_id
    ).amount
  end

  def logs_param
    {
      status_id: Status::STATUSES[:'On Process'],
      station_id: 1,
      date: Time.zone.now.to_date,
      notes: '-'
    }
  end

  def handle_shipping_items
    @params[:shipping_items].each do |item|
      @shipment.shipment_items.build({
                                       description: item[:description],
                                       width: item[:width],
                                       length: item[:length],
                                       height: item[:height]
                                     })
    end
  end
end
