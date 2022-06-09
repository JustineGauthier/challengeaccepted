class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.string :frequency
      t.date :start_date
      t.date :end_date
      
      t.timestamps
    end
  end
end
