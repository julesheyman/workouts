class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :description
      t.integer :user_id
      t.integer :sport_id
      t.string :distance
      t.string :date

      t.timestamps
    end
  end
end
