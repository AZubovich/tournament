class AddDetailsToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :prize_winner, :integer
    add_column :tournaments, :prize_distribution, :string
  end
end
