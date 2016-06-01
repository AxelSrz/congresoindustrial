class AgregaIndexVisitasYTalleres < ActiveRecord::Migration
  def change
    add_index :atendees, :visit_id, using: :btree
    add_index :atendees, :workshop_id, using: :btree
  end
end
