class AddEventsCountToSportTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :sport_types, :events_count, :integer, default: 0
  end
end
