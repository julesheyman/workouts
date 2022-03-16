class FastestTime < ApplicationRecord
  # Direct associations

  belongs_to :sport

  belongs_to :workout

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sport.to_s
  end
end
