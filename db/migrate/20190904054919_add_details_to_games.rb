class AddDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :first_player_name, :string
    add_column :games, :second_player_name, :string
  end
end
