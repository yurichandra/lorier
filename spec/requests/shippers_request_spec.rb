require 'rails_helper'

RSpec.describe ShippersController, type: :request do
  include_context 'administrative divisions'

  describe '#create' do
    context 'when param is valid' do
      it 'does return created HTTP status and its response' do
        post shippers_path,
        params: {
          province_id: 1,
          city_id: 1,
          district_id: 1,
          name: 'test',
          address: 'test',
          phone_number: '021234567'
        }

        shipper = Shipper.first

        expect(response).to have_http_status :created
        expect(JSON.parse(response.body)).to eql({
          'data' => {
            'id' => shipper.id.to_s,
            'type' => 'shipper',
            'attributes' => {
              'name' => shipper.name,
              'phone_number' => shipper.phone_number,
              'address' => shipper.address
            }
          }
        })
      end
    end

    context 'when param is invalid' do
      it 'does return HTTP unprocessable entity status' do
        post shippers_path,
        params: {
          city_id: 1,
          district_id: 1,
          name: 'test',
          phone_number: '021234567'
        }

        shipper = Shipper.first

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
