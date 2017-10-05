class AddDeletedAtToForumPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :forum_posts, :deleted_at, :datetime
    add_index :forum_posts, :deleted_at
  end
end
