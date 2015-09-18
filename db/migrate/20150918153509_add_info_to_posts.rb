class AddInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :address_1, :string
    add_column :posts, :address_2, :string
    add_column :posts, :city, :string
    add_column :posts, :state, :string
    add_column :posts, :zip, :integer
  end
end
