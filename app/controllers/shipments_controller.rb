class ShipmentsController < ApplicationController
  def create
  end

  private

  def shipment_create_params
    params.permit(
      :shipping_date,
      :shipping_notes,
      :items => [
        :description,
        :length,
        :width,
        :height,
        :quantity,
        :amount
      ]
    )
  end
end