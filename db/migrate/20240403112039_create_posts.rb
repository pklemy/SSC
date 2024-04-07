class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :employee, foreign_key: true
      t.string :title
      t.string :body
      t.integer :genre
      

      t.timestamps
    end
  end
end
