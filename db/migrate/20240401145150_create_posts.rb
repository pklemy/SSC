class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :employee, foreign_key: true, null: false
      t.references :store, foreign_key: true, null: false
      t.string :title
      t.string :body
      t.integer :genre
      t.references :vendor, foreigh_key: true
      
      t.timestamps
    end
  end
end
