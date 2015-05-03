class AddEmailIdToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :email, index: true, foreign_key: true
  end
end
