class RemoveUniversityFromAtendees < ActiveRecord::Migration
  def change
    remove_column :atendees, :university, :string
  end
end
