class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :preferred_contact, :string
  end
end
