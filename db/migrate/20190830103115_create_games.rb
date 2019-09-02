class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :first_player_id
      t.integer :second_player_id
      t.integer :first_player_time
      t.integer :second_player_time
      t.integer :task_id
      t.references :tournament, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
