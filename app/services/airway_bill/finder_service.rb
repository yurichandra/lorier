module AirwayBill
  class FinderService
    def initialize(airway_bills)
      @airway_bills = airway_bills
    end

    def perform
      find_airway_bills
    end

    private

    def find_airway_bills
      Shipment.where(airway_bill: @airway_bills).includes(:status)
    end
  end
end
