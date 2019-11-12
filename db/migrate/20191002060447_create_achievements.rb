class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.text :description
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
