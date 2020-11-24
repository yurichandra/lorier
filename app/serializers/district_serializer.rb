class DistrictSerializer
  include FastJsonapi::ObjectSerializer

  attribute :id, :name
end
