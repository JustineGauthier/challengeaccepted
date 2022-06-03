class RemovePointsToChallenges < ActiveRecord::Migration[6.1]
  def change
    remove_column :challenges, :points
  end
end
