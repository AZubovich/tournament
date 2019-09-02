class AddKindToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :kind, :string
  end
end
