class StationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :address, :phone_number
end
