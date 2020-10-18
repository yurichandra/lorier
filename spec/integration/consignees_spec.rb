require 'swagger_helper'

describe 'Consignee API' do
  path '/consignees' do
    get 'Get all consignees' do
      tags 'Consignees'
      produces 'application/json'
      response '200', 'OK' do
        run_test!
      end 
    end
  end

  path '/consignees/{id}' do
    get 'Get a consignee' do
      tags 'Consignees'
      produces 'application/json'
      parameter name: :consginee_id, in: :path
      response '200', 'OK' do
        run_test!
      end
      response '404', 'Resource not found' do
        run_test!
      end
    end
  end

  path '/consignees' do
    post 'Store a new consignee' do
      tags 'Consignees'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :consignees_request, in: :body, schema: {
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
