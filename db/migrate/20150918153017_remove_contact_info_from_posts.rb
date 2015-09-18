class RemoveContactInfoFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :contact_info, :string
  end
end
