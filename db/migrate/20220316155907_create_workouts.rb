class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :description
      t.integer :sport_id
      t.string :distance
      t.string :date
      t.string :name

      t.timestamps
    end
  end
end
