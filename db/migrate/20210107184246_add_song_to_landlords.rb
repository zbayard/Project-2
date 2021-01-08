class AddSongToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :song, :string
  end
end
