class CreateForumPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_posts do |t|
      t.references :forum_thread, null: false, index: true
      t.references :member, null: false
      t.text :body
      t.timestamps null: false
    end
  end
end
