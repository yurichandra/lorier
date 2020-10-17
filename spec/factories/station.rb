FactoryBot.define do
  factory :station do
    name { 'test' }
    address { 'jln.pemuda' }
    phone_number { '02111111' }
    province_id { 1 }
    city_id { 1 }
    district_id { 1 }
  end
end