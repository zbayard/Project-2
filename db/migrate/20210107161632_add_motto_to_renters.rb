class AddMottoToRenters < ActiveRecord::Migration[6.0]
  def change
    add_column :renters, :motto, :string
  end
end
