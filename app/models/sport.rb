class Sport < ApplicationRecord
  # Direct associations

  has_many   :workouts,
             dependent: :destroy

  has_many   :fastest_times,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
