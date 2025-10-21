class CreateUsers < ActiveRecord::Migration[8.0]
  has_secure_password

  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false, contraint: { unique: true }
      t.string :password_digest, null: false
      t.datetime :date_of_birth
      t.string :avatar, default: ''
      t.timestamps
    end
  end
end
