require 'rails_helper'

RSpec.describe AirwayBillsController, type: :request do
  include_context 'administrative divisions'

  let!(:station) { FactoryBot.create(:station, id: 1) }
  let!(:service) { FactoryBot.create(:service) }
  let!(:status) { FactoryBot.create(:status, :on_process) }
  let(:shipper) { FactoryBot.create(:shipper) }
  let(:consignee) { FactoryBot.create(:consignee) }
  let!(:shipment) do
    FactoryBot.create(
      :shipment,
      airway_bill: '123123',
      service: service,
      shipper: shipper,
      consignee: consignee,
      status: status,
      shipping_date: Time.zone.today.to_date,
      shipping_notes: '-'
    )
  end

  describe '#index' do
    context 'with airway bills param' do
      it 'does return airway bills' do
        get airway_bills_path, params: { airway_bills: '123123' }
        shipment = Shipment.first

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body)).to eql({
          'data' => [{
            'id' => shipment.id.to_s,
            'type' => 'airway_bill',
            'attributes' => {
              'service_code' => shipment.service_code,
              'airway_bill' => shipment.airway_bill,
              'shipping_date' => shipment.shipping_date.strftime('%Y-%m-%d'),
              'receive_date' => shipment.receive_date
            },
            'relationships' => {
              'status' => {
                'data' => {
                  'id' => shipment.status.id.to_s,
                  'type' => 'status'
                }
              }
            }
          }],
          'included' => [{
            'id' => shipment.status.id.to_s,
            'type' => 'status',
            'attributes' => {
              'id' => shipment.status.id,
              'name' => shipment.status.name
            }
          }]
        })
      end
    end

    context 'without airway bills param' do
      it 'does return ok status with empty data' do
        get airway_bills_path

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body)).to eql({
          'data' => [],
          'included' => []
        })
      end
    end
  end
end
