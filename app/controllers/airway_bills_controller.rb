class AirwayBillsController < ApplicationController
  def index
    airway_bills = parse_airway_bills_params
    result = AirwayBill::FinderService.new(airway_bills).perform

    options = { include: [:status] }

    render json: AirwayBillSerializer.new(result, options).serialized_json
  end

  private

  def parse_airway_bills_params
    return if params[:airway_bills].nil?

    params[:airway_bills].split(',')
  end
end
