class AddUniversidadToAtendees < ActiveRecord::Migration
  def change
    add_column :atendees, :universidad, :string
  end
end
