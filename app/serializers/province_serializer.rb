class ProvinceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name
end
