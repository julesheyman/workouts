class WorkoutResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :user_id, :integer
  attribute :sport_id, :integer
  attribute :distance, :string
  attribute :date, :string

  # Direct associations

  # Indirect associations

end