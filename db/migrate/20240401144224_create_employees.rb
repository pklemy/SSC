class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :store, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
