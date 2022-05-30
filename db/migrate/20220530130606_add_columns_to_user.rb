class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :total_points, :integer
  end
end
