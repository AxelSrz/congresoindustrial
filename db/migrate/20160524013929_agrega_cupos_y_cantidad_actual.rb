class AgregaCuposYCantidadActual < ActiveRecord::Migration
  def change
    add_column :visits, :cupo_actual, :integer
    add_column :workshops, :cupo_actual, :integer
    add_column :visits, :cupo_maximo, :integer
    add_column :workshops, :cupo_maximo, :integer
  end
end
