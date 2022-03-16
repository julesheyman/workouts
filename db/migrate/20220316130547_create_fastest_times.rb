class CreateFastestTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :fastest_times do |t|
      t.integer :sport_id
      t.string :time_spent
      t.integer :workout_id

      t.timestamps
    end
  end
end
