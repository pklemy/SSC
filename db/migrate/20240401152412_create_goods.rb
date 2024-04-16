class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
      t.index [:employee_id, :post_id], unique: true
    end
  end
end