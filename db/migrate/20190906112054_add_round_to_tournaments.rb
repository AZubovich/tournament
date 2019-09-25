class AddRoundToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :round, :integer
  end
end
