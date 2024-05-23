class CreateAuditLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :audit_logs do |t|
      t.references :authentication, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :action
      t.string :changes_client

      t.timestamps
    end
  end
end
