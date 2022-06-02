class AddStartedtoChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :started, :boolean
  end
end
