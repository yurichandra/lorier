class StatusSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name
end