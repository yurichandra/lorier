class ConsigneesController < ApplicationController
  include ExceptionHandler

  def index
    consignees = Consignee.all

    render json: ConsigneeSerializer.new(consignees).serialized_json
  end

  def show
    consignee = Consignee.find(params[:id])

    render json: ConsigneeSerializer.new(consignee).serialized_json
  end

  def create
    consignee = Consignee.new(consignee_params)

    if consignee.save
      render json: ConsigneeSerializer.new(consignee).serialized_json, status: :created
    else
      render json: ErrorSerializer.new(consignee.errors).serialized_json, status: :unprocessable_entity
    end
  end

  private

  def consignee_params
    params.permit(:province_id, :city_id, :district_id, :name, :phone_number, :address)
  end
end