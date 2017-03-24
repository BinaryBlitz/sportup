class AddMembershipsCountToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :memberships_count, :integer, default: 0
  end
end
