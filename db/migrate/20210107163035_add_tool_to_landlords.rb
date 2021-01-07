class AddToolToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :tool, :string
  end
end
