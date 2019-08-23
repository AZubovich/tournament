class AddLimitToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :limit, :integer
  end
end
