require 'swagger_helper'

describe 'Shipment API' do
  path '/shipments' do
    post 'store a new shipment' do
      tags 'Shipments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :shipment_requests, in: :body, schema: {
        type: :object,
        properties: {
          shipping_notes: { type: :string },
          shipping_date: { type: :string },
          service_code: { type: :string },
          shipper_id: { type: :integer },
          consignee_id: { type: :integer },
          shipment_items: {
            type: :array,
            items: {
              type: :object,
              properties: {
                description: { type: :string },
                width: { type: :number },
                height: { type: :number },
                length: { type: :number }
              }
            }
          },
        },
        required: [
          'shipping_notes',
          'shipping_date',
          'service_code',
          'shipper_id',
          'consignee_id',
          'shipment_items'
        ]
      }
      response '201', 'created' do
        run_test!
      end
      response '422', 'unprocessable_entity' do
        run_test!
      end
    end
  end
end
