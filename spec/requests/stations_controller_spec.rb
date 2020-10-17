require 'rails_helper'

RSpec.describe StationsController, type: :request do
  include_context 'administrative divisions'

  describe '#index' do
    let!(:station) { FactoryBot.create(:station) }

    it 'does return HTTP ok status' do
      get stations_path

      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body)).to eql({
        'data' => [{
          'id' => station.id.to_s,
          'type' => 'station',
          'attributes' => {
            'name' => station.name,
            'address' => station.address,
            'phone_number' => station.phone_number
          },
          'relationships' => {
            'province' => {
              'data' => {
                'id' => 1.to_s,
                'type' => 'province'
              }
            },
            'city' => {
              'data' => {
                'id' => 1.to_s,
                'type' => 'city'
              }
            },
            'district' => {
              'data' => {
                'id' => 1.to_s,
                'type' => 'district'
              }
            }
          }
        }]
      })
    end
  end

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
            },
            'relationships' => {
              'province' => {
                'data' => {
                  'id' => 1.to_s,
                  'type' => 'province'
                }
              },
              'city' => {
                'data' => {
                  'id' => 1.to_s,
                  'type' => 'city'
                }
              },
              'district' => {
                'data' => {
                  'id' => 1.to_s,
                  'type' => 'district'
                }
              }
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
  
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end