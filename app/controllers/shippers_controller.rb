class ShippersController < ApplicationController
  include ExceptionHandler

  def create
    shipper = Shipper.new(shipper_params)

    if shipper.save
      render json: ShipperSerializer.new(shipper).serialized_json, status: :created
    else
      render json: ErrorSerializer.new(shipper.errors).serialized_json, status: :unprocessable_entity
    end
  end

  private

  def shipper_params
    params.permit(:province_id, :city_id, :district_id, :name, :phone_number, :address)
  end
end
