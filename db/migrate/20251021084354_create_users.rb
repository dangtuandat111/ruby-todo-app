class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :hash_pw, null: false
      t.datetime :date_of_birth
      t.string :avatar, default: ''
      t.timestamps
    end
  end
end
