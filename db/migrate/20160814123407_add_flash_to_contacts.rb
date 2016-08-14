class AddFlashToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :flash, :string
  end
end
