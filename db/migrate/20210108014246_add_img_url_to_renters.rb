class AddImgUrlToRenters < ActiveRecord::Migration[6.0]
  def change
    add_column :renters, :img_url, :string
  end
end
