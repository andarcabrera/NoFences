class AddVolunteerToPost < ActiveRecord::Migration
  def change
    add_column :posts, :volunteer, :boolean
  end
end
