class AddDetailToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :detail, :text
  end
end
