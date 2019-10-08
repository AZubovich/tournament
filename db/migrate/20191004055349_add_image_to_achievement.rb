class AddImageToAchievement < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :image, :string
  end
end
