class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :nick_name
      t.integer :points
      t.references :user, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
