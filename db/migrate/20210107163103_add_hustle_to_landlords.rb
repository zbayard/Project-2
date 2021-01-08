class AddHustleToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :hustle, :string
  end
end
