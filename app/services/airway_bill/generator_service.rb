module AirwayBill
  class GeneratorService
    def initialize(service_code:, district_id:)
      @service_code = service_code
      @district_id = district_id
    end

    def perform
      number = Shipment.count + 1
      pad_number = format('%<number>05d', number: number)

      "#{@service_code}-#{@district_id}-#{pad_number}"
    end
  end
end
