class CreateForumThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_threads do |t|
      t.references :member, null: false
      t.string :subject, null: false
      t.timestamps null: false
    end
  end
end
