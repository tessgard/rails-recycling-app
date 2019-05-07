class AddAdminToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :admin, :boolean
  end
end
