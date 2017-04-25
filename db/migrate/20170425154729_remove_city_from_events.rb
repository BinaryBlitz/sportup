class RemoveCityFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_reference :events, :city, index: true
  end
end
