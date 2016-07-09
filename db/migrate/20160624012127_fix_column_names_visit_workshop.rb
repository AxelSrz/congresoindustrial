class FixColumnNamesVisitWorkshop < ActiveRecord::Migration
  def change
    rename_column :workshops, :nombre, :representante
    rename_column :workshops, :empresa, :tipo
    remove_column :visits, :nombre
  end
end
