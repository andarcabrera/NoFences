class AddInfoToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :address_1, :string
    add_column :organizations, :address_2, :string
    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :zip, :integer
  end
end
