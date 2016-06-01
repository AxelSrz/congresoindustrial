class AddFechasDeRegistro < ActiveRecord::Migration
  def change
    add_column :atendees, :hora_asignada, :datetime
  end
end
