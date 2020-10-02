class StationsController < ApplicationController
  def create
    station = Station.new(station_params)

    if station.save
      render json: StationSerializer.new(station).serialized_json, status: :created
    else
      render json: station.errors, status: :unprocessable_entity
    end
  end

  private

  def station_params
    params.permit(:name, :phone_number, :address, :province_id, :city_id, :district_id)
  end
end