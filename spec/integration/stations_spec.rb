require 'swagger_helper'

describe 'Stations API' do
  path '/stations' do
    post 'Create a station' do
      tags 'Stations'
      consumes 'application/json'
      parameter name: :station_request, in: :body, schema: {
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