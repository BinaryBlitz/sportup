class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.json :receipt, null: false
      t.string :platform
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
