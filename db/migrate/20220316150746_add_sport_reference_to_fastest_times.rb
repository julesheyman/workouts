class AddSportReferenceToFastestTimes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :fastest_times, :sports
    add_index :fastest_times, :sport_id
    change_column_null :fastest_times, :sport_id, false
  end
end
