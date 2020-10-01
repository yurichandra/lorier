class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.belongs_to :city
      t.string :name

      t.timestamps
    end
  end
end
