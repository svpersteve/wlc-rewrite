class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :member, null: false
      t.string :current_role
      t.boolean :learning_to_code
      t.boolean :actively_looking_for_engineering_role
      t.datetime :started_learning_to_code
      t.text :other_information
      t.text :admin_notes

      t.timestamps null: false
    end
  end
end
