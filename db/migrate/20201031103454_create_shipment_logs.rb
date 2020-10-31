class CreateShipmentLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_logs do |t|
      t.belongs_to :shipment
      t.belongs_to :status
      t.belongs_to :station
      t.datetime :date
      t.string :notes
      t.timestamps
    end
  end
end
