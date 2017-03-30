class AddTeamNumberToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :team_number, :integer
  end
end
