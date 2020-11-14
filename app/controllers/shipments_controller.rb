class ShipmentsController < ApplicationController
  def create
    shipment = Shipment.new(shipment_create_params.except(:shipping_items))
    shipment_form = ShipmentCreateForm.new(shipment, params)

    if shipment_form.save
      render json: ShipmentSerializer.new(shipment_form.shipment).serialized_json, status: :created
    else
      render json: ErrorSerializer.new(shipment_form.errors).serialized_json, status: :unprocessable_entity
    end
  end

  private

  def shipment_create_params
    params.permit(
      :service_code,
      :shipper_id,
      :consignee_id,
      :shipping_date,
      :shipping_notes,
      :shipping_items => [
        :description,
        :length,
        :width,
        :height,
        :quantity
      ]
    )
  end
end