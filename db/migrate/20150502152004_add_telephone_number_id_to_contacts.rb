class AddTelephoneNumberIdToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :telephone_number, index: true, foreign_key: true
  end
end
