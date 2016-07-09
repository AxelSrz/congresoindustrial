class AddDuracionToVisitAndWorkshop < ActiveRecord::Migration
  def change
    add_column :visits, :duracion, :string
    add_column :workshops, :duracion, :string
  end
end
