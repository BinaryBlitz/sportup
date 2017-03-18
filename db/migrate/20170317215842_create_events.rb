class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :starts_at, null: false
      t.time :ends_at, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :user_limit, null: false
      t.integer :team_limit, null: false
      t.boolean :public, default: true
      t.text :description, null: false
      t.integer :price, null: false
      t.belongs_to :sport_type, foreign_key: true
      t.references :creator, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
