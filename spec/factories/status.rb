FactoryBot.define do
  factory :status do
    name { 'Test' }

    trait :on_process do
      id { 1 }
      name { 'On Process' }
    end
  end
end