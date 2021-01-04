class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.integer :renter_id
      t.integer :landlord_id

      t.timestamps
    end
  end
end
