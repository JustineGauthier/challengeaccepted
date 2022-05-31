class AddTotalTimeToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :total_time, :integer
  end
end
