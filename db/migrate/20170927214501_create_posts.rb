class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.datetime :published_at
      t.references :author, references: :member
      t.timestamps null: false
    end
  end
end
