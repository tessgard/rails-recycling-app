class AddDefaultToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:products, :state, true)
  end
end
