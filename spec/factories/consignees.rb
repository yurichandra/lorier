FactoryBot.define do
  factory :consignee do
    name { "MyString" }
    phone_number { "MyString" }
    address { "MyString" }
    province
    city
    district
  end
end
