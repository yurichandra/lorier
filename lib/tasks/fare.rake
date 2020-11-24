namespace :fare do
  desc 'Populate fare to DB'
  task seed: :environment do
    data = [
      {
        service_code: 'ECO',
        origin_id: 3173020,
        destination_id: 3173030,
        amount: 3000
      },
      {
        service_code: 'EXP',
        origin_id: 3173020,
        destination_id: 3173030,
        amount: 15000
      },
      {
        service_code: 'REG',
        origin_id: 3173020,
        destination_id: 3173030,
        amount: 5000
      },
      {
        service_code: 'ECO',
        origin_id: 3173020,
        destination_id: 3171010,
        amount: 7000
      },
      {
        service_code: 'EXP',
        origin_id: 3173020,
        destination_id: 3171010,
        amount: 30000
      },
      {
        service_code: 'REG',
        origin_id: 3173020,
        destination_id: 3171010,
        amount: 15000
      }
    ]

    data.each do |item|
      Fare.create(item)
    end
  end
end