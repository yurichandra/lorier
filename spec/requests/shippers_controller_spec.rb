require 'rails_helper'

RSpec.describe ShippersController, type: :request do
  include_context 'administrative divisions'

  describe '#index' do
    context 'without any query' do
      let!(:shipper) { FactoryBot.create(:shipper) }

      it 'does return HTTP ok status and its response' do
        get shippers_path

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body)).to eql({
          'data' => [{
            'id' => shipper.id.to_s,
            'type' => 'shipper',
            'attributes' => {
              'name' => shipper.name,
              'phone_number' => shipper.phone_number,
              'address' => shipper.address
            }
          }]
        })
      end
    end

    context 'with name query' do
      let!(:shipper) { FactoryBot.create(:shipper, name: 'Test') }

      it 'does return HTTP ok status and its response' do
        get shippers_path,
        params: {
          query: 'Test'
        }

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body)).to eql({
          'data' => [{
            'id' => shipper.id.to_s,
            'type' => 'shipper',
            'attributes' => {
              'name' => shipper.name,
              'phone_number' => shipper.phone_number,
              'address' => shipper.address
            }
          }]
        })
      end
    end
  end

  describe '#show' do
    context 'when shipper is found' do
      let!(:shipper) { FactoryBot.create(:shipper) }

      it 'does return HTTP ok status and its response' do
        get shipper_path(shipper.id)

        expect(response).to have_http_status :ok
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

    context 'when shipper is not found' do
      it 'does return HTTP not found status' do
        get shipper_path(1)

        expect(response).to have_http_status :not_found
      end
    end
  end

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
