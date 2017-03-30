class DropTeamsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams, force: :cascade
    drop_table :joins, force: :cascade
  end
end
