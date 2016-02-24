class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :nombre
      t.text :descripcion
      t.string :empresa
      t.string :lugar
      t.datetime :fecha
      t.timestamps null: false
    end
  end
end
