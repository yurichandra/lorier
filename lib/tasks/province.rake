require 'csv'

namespace :province do
  desc 'Populate province data to DB'
  task seed: :environment do
    key = { :id => 0, :name => 1 }
    data = CSV.read(File.join(Rails.root, '/csv/provinces.csv'))

    data.each do |item|
      Province.create_with(name: item[key[:name]]).find_or_create_by(id: item[key[:id]])
    end

    p 'Populate provinces data has been succeed'
  end
end
