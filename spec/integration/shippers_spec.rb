require 'swagger_helper'

describe 'Shipper API' do
  path '/shippers/{id}' do
    get 'Find a shipper by ID' do
      tags 'Shippers'
      produces 'application/json'
      parameter name: :shipper_id, in: :path
      response '200', 'OK' do
        run_test!
      end
      response '404', 'Resource not found' do
        run_test!
      end
    end
  end

  path '/shippers' do
    post 'Store a new shipper' do
      tags 'Shippers'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :shippers_request, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          phone_number: { type: :string },
          province_id: { type: :integer },
          city_id: { type: :integer },
          district_id: { type: :integer }
        },
        required: [
          'name',
          'address',
          'phone_number',
          'province_id',
          'city_id',
          'district_id'
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
