class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.belongs_to :province
      t.belongs_to :city
      t.belongs_to :district
      t.string :name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
