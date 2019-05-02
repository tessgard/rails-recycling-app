class AddBusinessToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :business, foreign_key: true
  end
end
