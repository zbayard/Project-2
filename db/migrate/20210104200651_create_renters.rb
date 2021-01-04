class CreateRenters < ActiveRecord::Migration[6.0]
  def change
    create_table :renters do |t|
      t.string :name
      t.integer :age
      t.string :username
      t.string :user_type

      t.timestamps
    end
  end
end
