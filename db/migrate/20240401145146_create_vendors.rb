class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.references :store, null: false, foreign_key: true
      t.string :url, null:folse
      t.string :phone_number, null:folse
      t.string :name, null:folse

      t.timestamps
    end
  end
end
