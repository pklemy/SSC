class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.references :employee, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :store_hash, null: false

      t.timestamps
    end
  end
end
