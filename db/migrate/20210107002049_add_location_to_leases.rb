class AddLocationToLeases < ActiveRecord::Migration[6.0]
  def change
    add_column :leases, :location, :string
  end
end
