class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :money
      t.references :tournament, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
