class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :service_code
      t.belongs_to :status
      t.belongs_to :consignee
      t.belongs_to :shipper
      t.string :airway_bill
      t.string :shipping_notes
      t.date :shipping_date
      t.string :receive_notes
      t.date :receive_date
      t.decimal :amount

      t.timestamps
    end

    add_index :shipments, :airway_bill
  end
end
