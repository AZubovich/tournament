class AddRoundToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :round, :integer
  end
end
