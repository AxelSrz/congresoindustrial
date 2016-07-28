class AgregaRecuperacion < ActiveRecord::Migration
  def change
    add_column :atendees, :recovery_code, :string
  end
end
