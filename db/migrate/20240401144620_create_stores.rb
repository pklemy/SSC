class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name, null:folse
      t.string :store_address, null:folse
      t.string :stroe_phone, null:folse

      t.timestamps
    end
  end
end
