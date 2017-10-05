class CreateForumThreadVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_thread_visits do |t|
      t.references :member, null: false, index: true
      t.references :forum_thread, null: false
      t.timestamps null: false
    end
  end
end
