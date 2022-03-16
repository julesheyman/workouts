class AddUserReferenceToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :workouts, :users
    add_index :workouts, :user_id
    change_column_null :workouts, :user_id, false
  end
end
