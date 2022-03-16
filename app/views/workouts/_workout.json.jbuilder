json.extract! workout, :id, :description, :user_id, :sport_id, :distance,
              :date, :created_at, :updated_at
json.url workout_url(workout, format: :json)
