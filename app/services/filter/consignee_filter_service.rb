module Filter
  class ConsigneeFilterService
    def initialize(query)
      @query = query
    end

    def perform
      return Consignee.all if @query.nil?

      filter_by_name
    end

    def filter_by_name
      Consignee.where('name ILIKE ?', "%#{@query}%")
    end
  end
end
