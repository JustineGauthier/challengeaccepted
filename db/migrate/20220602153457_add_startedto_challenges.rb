class AddStartedtoChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :started, :boolean
    add_column :challenges, :time_left, :integer
  end
end
