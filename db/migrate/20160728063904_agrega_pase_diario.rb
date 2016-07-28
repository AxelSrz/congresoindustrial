class AgregaPaseDiario < ActiveRecord::Migration
  def change
    add_column :atendees, :pase_diario, :boolean, :default => false
  end
end
