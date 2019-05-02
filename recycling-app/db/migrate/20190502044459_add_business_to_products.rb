class AddBusinessToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :business_id, :integer, index: true
    add_foreign_key :products, :businesses, column: :business_id
  end
end
