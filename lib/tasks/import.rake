require 'csv'

namespace :import do
  desc 'Populate province data to DB'
  task province: :environment do
    key = { :id => 0, :name => 1 }
    data = CSV.read(File.join(Rails.root, '/csv/provinces.csv'))

    data.each do |item|
      Province.create_with(name: item[key[:name]]).find_or_create_by(id: item[key[:id]])
    end

    p 'Populate provinces data has been succeed'
  end

  desc 'Populate city data to DB'
  task city: :environment do
    key = {
      :id => 0,
      :province_id => 1,
      :name => 2
    }

    data = CSV.read(File.join(Rails.root, '/csv/regencies.csv'))

    data.each do |item|
      City.create_with(province_id: item[key[:province_id]], name: item[key[:name]]).find_or_create_by(id: item[key[:id]])
    end

    p 'Populate cities data has been succeed'
  end

  desc 'Populate district data to DB'
  task district: :environment do
    key = {
      :id => 0,
      :city_id => 1,
      :name => 2
    }

    data = CSV.read(File.join(Rails.root, '/csv/districts.csv'))

    data.each do |item|
      District.create_with(
        city_id: item[key[:city_id]],
        name: item[key[:name]]
      ).find_or_create_by(id: item[key[:id]])
    end

    p 'Populate districts data has been succeed'
  end
end
