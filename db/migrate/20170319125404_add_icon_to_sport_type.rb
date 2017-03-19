class AddIconToSportType < ActiveRecord::Migration[5.0]
  def change
    add_column :sport_types, :icon, :string
    change_column_null :sport_types, :icon, false
  end
end
