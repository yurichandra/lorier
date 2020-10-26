require 'rails_helper'

RSpec.describe Filter::ShipperFilterService do
  include_context 'administrative divisions'

  describe '#perform' do
    context 'when query by name' do
      let!(:shipper) { FactoryBot.create(:shipper, name: 'Test') }

      it 'does found shipper with certain name' do
        result = described_class.new('Test').perform

        expect(result.size).to eql 1
        expect(result.first.name).to eql shipper.name
      end      
    end
  end
end