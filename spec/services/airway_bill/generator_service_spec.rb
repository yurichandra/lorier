require 'rails_helper'

RSpec.describe AirwayBill::GeneratorService do
  describe '#perform' do
    let(:service_code) { 'TES' }
    let(:district_id) { '317100' }

    it 'should return an airway bill' do
      result = described_class.new(service_code: service_code, district_id: district_id).perform
      
      expect(result).to eql 'TES-317100-00001'
    end
  end
end