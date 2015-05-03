class AddAddressIdToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :address, index: true, foreign_key: true
  end
end
