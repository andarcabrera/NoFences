class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.integer :category_id
      t.string :title, null: false
      t.text :body, null: false
      t.string :contact_info

      t.timestamps null: false
    end
  end
end
