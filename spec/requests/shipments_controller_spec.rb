require 'rails_helper'

RSpec.describe ShipmentsController, type: :request do
  include_context 'administrative divisions'

  let!(:station) { FactoryBot.create(:station, id: 1) }
  let!(:service) { FactoryBot.create(:service) }
  let!(:status) { FactoryBot.create(:status, :on_process) }
  let(:shipper) { FactoryBot.create(:shipper) }
  let(:consignee) { FactoryBot.create(:consignee) }
  let!(:fare) do
    FactoryBot.create(
      :fare,
      service_code: service.code,
      origin_id: shipper.district_id,
      destination_id: consignee.district_id,
      amount: 5000
    )
  end

  describe '#create' do
    context 'when valid' do
      let(:params) do
        {
          "shipping_notes": "-",
          "shipping_date": "2020-11-13",
          "service_code": service.code,
          "shipper_id": shipper.id,
          "consignee_id": consignee.id,
          "shipping_items": [
            {
              "description": "Amplop",
              "width": 0,
              "height": 0,
              "length": 0
            }
          ]
        }
      end

      it 'does return created HTTP status' do
        post shipments_path, params: params

        shipment = Shipment.first

        expect(response).to have_http_status :created
        expect(JSON.parse(response.body)).to eql({
          'data' => {
            'id' => shipment.id.to_s,
            'type' => 'shipment',
            'attributes' => {
              'airway_bill' => shipment.airway_bill,
              'shipping_date' => shipment.shipping_date.strftime('%Y-%m-%d'),
              'shipping_notes' => shipment.shipping_notes
            },
            'relationships' => {
              'shipment_items' => {
                'data' => [
                  {
                    'id'=> shipment.shipment_items.first.id.to_s,
                    'type'=> 'shipment_item'
                  }
                ]
              }
            }
          }
        })
      end
    end

    context 'when invalid' do
      let(:params) do
        {
          "shipping_date": "2020-11-13",
          "service_code": service.code,
          "shipper_id": shipper.id,
          "consignee_id": consignee.id,
          "shipping_items": [
            {
              "description": "Amplop",
              "width": 0,
              "height": 0,
              "length": 0
            }
          ]
        }
      end

      it 'does return HTTP unprocessable entity status' do
        post shipments_path, params: params

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
