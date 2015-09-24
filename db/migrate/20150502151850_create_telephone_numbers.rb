class CreateTelephoneNumbers < ActiveRecord::Migration
  def change
    create_table :telephone_numbers do |t|
      t.string :number
      t.string :label
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
