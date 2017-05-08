class ChangeDescriptionInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_null :events, :description, true
  end
end
