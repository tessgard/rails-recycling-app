class AddDeactivatedToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :deactivated, :boolean
  end
end
