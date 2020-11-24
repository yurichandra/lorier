namespace :status do
  desc 'Populate status data to DB'
  task seed: :environment do
    data = [
      'On Process',
      'Received at Sorting House',
      'Received at Warehouse',
      'With Delivery Courier',
      'Delivered'
    ]

    data.each do |item|
      Status.find_or_create_by(name: item)
    end
  end
end
