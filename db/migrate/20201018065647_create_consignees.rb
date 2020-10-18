class CreateConsignees < ActiveRecord::Migration[5.2]
  def change
    create_table :consignees do |t|
      t.belongs_to :province
      t.belongs_to :city
      t.belongs_to :district
      t.string :name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
