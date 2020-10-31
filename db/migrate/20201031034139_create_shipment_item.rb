class CreateShipmentItem < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_items do |t|
      t.belongs_to :shipment
      t.string :description
      t.decimal :width
      t.decimal :length
      t.decimal :height
      t.integer :quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
