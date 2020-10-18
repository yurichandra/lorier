class ConsigneeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :phone_number, :address
end