class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services, id: false, primary_key: :code do |t|
      t.string :code
      t.string :name
      t.string :estimation

      t.timestamps
    end
  end
end
