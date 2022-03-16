class AddSportReferenceToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :workouts, :sports
    add_index :workouts, :sport_id
    change_column_null :workouts, :sport_id, false
  end
end
