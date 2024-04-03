class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :employee, foreigh_key: true
      t.references :store, foreigh_key: true
      t.integer :genre, null: false
      

      t.timestamps
    end
  end
end
