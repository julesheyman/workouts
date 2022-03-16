class SportResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  has_many   :workouts

  has_many   :fastest_times

  # Indirect associations
end
