FactoryBot.define do
  factory :shipper do
    name { "MyString" }
    phone_number { "08211111111" }
    address { "MyString" }
    province
    city
    district
  end
end