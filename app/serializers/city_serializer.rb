class CitySerializer
  include FastJsonapi::ObjectSerializer

  attribute :id, :name
end