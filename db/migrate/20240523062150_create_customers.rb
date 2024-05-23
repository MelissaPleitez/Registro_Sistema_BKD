class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :client_email
      t.string :tel_number
      t.references :authentication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
