class AddTrainToRenters < ActiveRecord::Migration[6.0]
  def change
    add_column :renters, :train, :string
  end
end
