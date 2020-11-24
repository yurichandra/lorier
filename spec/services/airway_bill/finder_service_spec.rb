require 'rails_helper'

RSpec.describe AirwayBill::FinderService do
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
  
  describe '#perform' do
    it 'does return airway bills' do
      results = described_class.new(['123123']).perform

      expect(results.size).to eql 1
      expect(results.first.airway_bill).to eql '123123'
    end
  end
end
