class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :other_lines
      t.string :town
      t.string :postcode
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
