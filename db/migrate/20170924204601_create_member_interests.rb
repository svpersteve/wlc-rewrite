class CreateMemberInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :member_interests do |t|
      t.references :member, null: false
      t.references :interest, references: :hackroom, index: { unique: true }, null: false
    end
  end
end
