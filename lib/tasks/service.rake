namespace :service do
  task seed: :environment do
    data = [
      {
        code: 'REG',
        name: 'Regular',
        estimation: '2-3 days'
      },
      {
        code: 'EXP',
        name: 'Express',
        estimation: '1-2 days'
      },
      {
        code: 'ECO',
        name: 'Economy',
        estimation: '4-5 days'
      }
    ]

    data.each do |item|
      Service.find_or_create_by(code: item[:code]) do |service|
        service.name = item[:name]
        service.estimation = item[:estimation]
      end
    end
  end
end
