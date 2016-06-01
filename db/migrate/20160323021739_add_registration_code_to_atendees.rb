class AddRegistrationCodeToAtendees < ActiveRecord::Migration
  def change
    add_column :atendees, :registration_code, :string
  end
end
