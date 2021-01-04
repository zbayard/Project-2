class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :renter_id
      t.integer :landlord_id
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
