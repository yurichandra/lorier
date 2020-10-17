class StationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :address, :phone_number

  belongs_to :province
  belongs_to :city
  belongs_to :district
end
