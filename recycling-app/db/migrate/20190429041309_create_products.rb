class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :category
      t.integer :quantity
      t.string :location

      t.timestamps
    end
  end
end
