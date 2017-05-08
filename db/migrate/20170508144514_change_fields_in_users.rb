class ChangeFieldsInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :phone_number, true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true
    add_column :users, :username, :string
  end
end
