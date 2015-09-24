class AddActiveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :active, :boolean, :null => false, :default => true
  end
end
