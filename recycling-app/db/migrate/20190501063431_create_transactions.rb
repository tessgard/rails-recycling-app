class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
