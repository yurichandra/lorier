require 'rails_helper'

RSpec.describe StationsController, type: :request do
  include_context 'administrative divisions'

  describe '#create' do
    context 'when params is valid' do
      it 'does return HTTP created and its response' do
        post stations_path,
        params: {
          province_id: 1,
          city_id: 1,
          district_id: 1,
          name: 'test',
          address: 'test',
          phone_number: '021234567'
        }

        station = Station.first

        expect(response).to have_http_status :created
        expect(JSON.parse(response.body)).to eql({
          'data' => {
            'id' => station.id.to_s,
            'type' => 'station',
            'attributes' => {
              'name' => station.name,
              'address' => station.address,
              'phone_number' => station.phone_number
            }
          }
        })
      end
    end

    context 'when param is invalid' do
      context 'phone number in string' do
        it 'does return unprocessable entity http status' do
          post stations_path,
          params: {
            province_id: 1,
            city_id: 1,
            district_id: 1,
            name: 'test',
            address: 'test',
            phone_number: 'test'
          }
  
          station = Station.first
  
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end