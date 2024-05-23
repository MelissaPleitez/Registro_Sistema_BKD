class CreateCustomerIdentifications < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_identifications do |t|
      t.string :identification_type
      t.string :identification_number
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
