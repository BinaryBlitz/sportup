class CreateSportTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :sport_types do |t|
      t.string :name, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
