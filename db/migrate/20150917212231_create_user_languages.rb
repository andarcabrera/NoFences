class CreateUserLanguages < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.integer :user_id, null: false
      t.integer :language_id, null: false

      t.timestamps null: false
    end
  end
end
