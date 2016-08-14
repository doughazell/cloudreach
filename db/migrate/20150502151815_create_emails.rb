class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.string :label
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
