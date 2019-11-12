class FixImageUrl < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :achievements, :image_url, :badge_url
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
