class AddViolationsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :violations_count, :integer, default: 0
  end
end
