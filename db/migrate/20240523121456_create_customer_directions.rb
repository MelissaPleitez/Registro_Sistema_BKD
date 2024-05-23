class CreateCustomerDirections < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_directions do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
