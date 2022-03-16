json.extract! fastest_time, :id, :sport_id, :time_spent, :workout_id,
              :created_at, :updated_at
json.url fastest_time_url(fastest_time, format: :json)
