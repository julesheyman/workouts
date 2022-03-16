json.extract! workout, :id, :description, :sport_id, :distance, :date, :name,
              :created_at, :updated_at
json.url workout_url(workout, format: :json)
