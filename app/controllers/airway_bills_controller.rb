class AirwayBillsController < ApplicationController
  include ExceptionHandler

  def index
    airway_bills = parse_airway_bills_params
    result = AirwayBill::FinderService.new(airway_bills).perform

    options = { params: { action: 'index' }}

    render json: AirwayBillSerializer.new(result, options).serialized_json
  end

  def show
    airway_bill = Shipment.includes(:shipment_logs, :shipper, :consignee, :status)
                          .find_by!(airway_bill: params[:airway_bill])

    options = { params: { action: 'show' }}

    render json: AirwayBillSerializer.new(airway_bill, options).serialized_json
  end

  private

  def parse_airway_bills_params
    return if params[:airway_bills].nil?

    params[:airway_bills].split(',')
  end
end
