class CreateForumPostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_post_likes do |t|
      t.references :member, null: false
      t.references :forum_post, null: false
      t.timestamps null: false
    end
  end
end
