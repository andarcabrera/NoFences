class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.integer :organization_id
      t.integer :rater_id

      t.timestamps null: false
    end
  end
end
