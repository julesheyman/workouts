class WorkoutResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :sport_id, :integer
  attribute :distance, :string
  attribute :date, :string
  attribute :name, :string

  # Direct associations

  belongs_to :sport

  has_many   :fastest_times

  # Indirect associations
end
