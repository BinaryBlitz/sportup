class AddPasswordToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :password, :string
  end
end
