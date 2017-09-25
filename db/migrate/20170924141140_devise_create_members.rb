class DeviseCreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name,               null: false, default: ""
      t.string :username,           null: false, default: ""
      t.string :slug
      t.string :email,              null: false, default: ""
      t.string :provider
      t.integer :uid
      t.string :image
      t.text :bio
      t.string :city
      t.string :country
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.string :github
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      t.timestamps null: false
    end
    add_index :members, :email,                unique: true
    add_index :members, :reset_password_token, unique: true
    add_index :members, :confirmation_token,   unique: true
  end
end
