class AddPointsToProgressions < ActiveRecord::Migration[6.1]
  def change
    add_column :progressions, :points, :integer
  end
end
