class AddConfirmadoToAtendees < ActiveRecord::Migration
  def change
    add_column :atendees, :confirmado, :boolean, :default => false
  end
end
