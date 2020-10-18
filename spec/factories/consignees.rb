FactoryBot.define do
  factory :consignee do
    name { "MyString" }
    phone_number { "08211111111" }
    address { "MyString" }
    province
    city
    district
  end
end
