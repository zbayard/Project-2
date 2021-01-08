class AddImgUrlToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :img_url, :string
  end
end
