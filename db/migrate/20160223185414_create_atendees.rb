class CreateAtendees < ActiveRecord::Migration
  def change
    create_table :atendees do |t|
      t.string :nombre
      t.string :email
      t.integer :workshop_id
      t.integer :visit_id
      t.string :university
      t.datetime :fecha_registro
      t.string :encrypted_password
      t.string :salt
      t.timestamps null: false
    end
  end
end
