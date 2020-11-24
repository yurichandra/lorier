class CreateFares < ActiveRecord::Migration[6.0]
  def change
    create_table :fares do |t|
      t.string :service_code
      t.bigint :origin_id
      t.bigint :destination_id
      t.decimal :amount
    end
  end
end
