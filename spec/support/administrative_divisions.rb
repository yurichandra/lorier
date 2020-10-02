RSpec.shared_context 'administrative divisions', :shared_context => :metadata do
  FactoryBot.create(:province)
  FactoryBot.create(:city)
  FactoryBot.create(:district)
end

RSpec.configure do |rspec|
  rspec.include_context 'administrative divisions', :include_shared => true
end