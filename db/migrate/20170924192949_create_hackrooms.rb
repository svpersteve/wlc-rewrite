class CreateHackrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :hackrooms do |t|
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.text :long_description
      t.string :slack
      t.string :image
      t.string :colour
      t.timestamps null: false
    end
  end
end
