class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description
      t.integer :prize
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
