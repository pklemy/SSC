class CreateEmployeeStores < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_stores do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
