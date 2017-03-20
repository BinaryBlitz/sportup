class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.integer :number, null: false


      t.timestamps
    end
  end
end
