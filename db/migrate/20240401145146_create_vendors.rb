class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.references :store, null: false, foreign_key: true
      t.string :vendor_name, null:false
      t.string :url, null:false
      t.string :phone, null:false
      t.string :name, null:false

      t.timestamps
    end
  end
end
