class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :location
      t.string :username
      t.string :user_type

      t.timestamps
    end
  end
end
