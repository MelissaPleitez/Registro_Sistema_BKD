class AddJtiToAuthentications < ActiveRecord::Migration[7.1]
  def change
    add_column :authentications, :jti, :string
    add_index :authentications, :jti
  end
end
