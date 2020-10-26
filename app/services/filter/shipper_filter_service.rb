module Filter
  class ShipperFilterService
    def initialize(query)
      @query = query
    end

    def perform
      return Shipper.all if @query.nil?

      search_by_name
    end

    private

    def search_by_name
      Shipper.where('name ILIKE ?', "%#{@query}%")
    end
  end
end