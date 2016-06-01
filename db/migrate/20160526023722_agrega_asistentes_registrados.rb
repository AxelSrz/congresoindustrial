class AgregaAsistentesRegistrados < ActiveRecord::Migration
  def change
    add_column :visits, :asistentes_registrados, :integer
    add_column :workshops, :asistentes_registrados, :integer
  end
end
