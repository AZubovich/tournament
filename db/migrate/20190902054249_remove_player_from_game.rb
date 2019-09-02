class RemovePlayerFromGame < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :player, foreign_key: true
  end
end
