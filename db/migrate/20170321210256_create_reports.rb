class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :content
      t.boolean :violation, default: false
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.references :reported_user, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
