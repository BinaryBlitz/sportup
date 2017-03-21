class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.references :voted_user, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
