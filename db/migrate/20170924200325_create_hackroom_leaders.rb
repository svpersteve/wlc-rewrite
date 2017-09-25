class CreateHackroomLeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :hackroom_leaders do |t|
      t.references :member, index: { unique: true }
      t.references :hackroom, index: { unique: true }
      t.timestamps null: false
    end
  end
end
