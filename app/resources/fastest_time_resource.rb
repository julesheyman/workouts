class FastestTimeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sport_id, :integer
  attribute :time_spent, :string
  attribute :workout_id, :integer

  # Direct associations

  # Indirect associations

end
