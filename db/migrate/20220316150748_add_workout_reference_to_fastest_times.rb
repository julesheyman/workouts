class AddWorkoutReferenceToFastestTimes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :fastest_times, :workouts
    add_index :fastest_times, :workout_id
    change_column_null :fastest_times, :workout_id, false
  end
end
