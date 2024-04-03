class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :employee, foreign_key: true
      t.references :store, foreign_key: true
      t.references :good, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false
      t.integer :genre, null: false
      

      t.timestamps
    end
  end
end
