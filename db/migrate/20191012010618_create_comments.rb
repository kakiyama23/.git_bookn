class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :nickname
      t.integer :rate
      t.text :review
      t.integer :product_id
      t.timestamps
    end
  end
end
