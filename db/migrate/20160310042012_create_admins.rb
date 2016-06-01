class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :nombre
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.timestamps null: false
    end
  end
end
