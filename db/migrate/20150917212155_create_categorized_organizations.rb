class CreateCategorizedOrganizations < ActiveRecord::Migration
  def change
    create_table :categorized_organizations do |t|
      t.integer :category_id
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
