require 'rails_helper'

RSpec.describe ConsigneesController, :type => :request do
  include_context 'administrative divisions'

  describe '#show' do
    context 'when consignee is found' do
      let(:consignee) { FactoryBot.create(:consignee) }

      it 'does return consignee' do
        get consignee_path(consignee.id)

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body)).to eql({
          'data' => {
            'id' => consignee.id.to_s,
            'type' => 'consignee',
            'attributes' => {
              'name' => consignee.name,
              'phone_number' => consignee.phone_number,
              'address' => consignee.address
            }
          }
        })
      end
    end

    context 'when consignee is not found' do
      it 'does return HTTP status not found' do
        get consignee_path(1)

        expect(response).to have_http_status :not_found
        expect(JSON.parse(response.body)).to eql({
          'message' => 'resource_not_found'
        })
      end
    end
  end

  describe '#create' do
    context 'when param is valid' do
      it 'does return created HTTP status and its response' do
        post consignees_path,
        params: {
          province_id: 1,
          city_id: 1,
          district_id: 1,
          name: 'test',
          address: 'test',
          phone_number: '021234567'
        }

        consignee = Consignee.first

        expect(response).to have_http_status :created
        expect(JSON.parse(response.body)).to eql({
          'data' => {
            'id' => consignee.id.to_s,
            'type' => 'consignee',
            'attributes' => {
              'name' => consignee.name,
              'phone_number' => consignee.phone_number,
              'address' => consignee.address
            }
          }
        })
      end
    end
  end
end