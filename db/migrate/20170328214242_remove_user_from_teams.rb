class RemoveUserFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_reference :teams, :user
    add_foreign_key :teams, :events
  end
end
