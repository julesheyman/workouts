class Workout < ApplicationRecord
  # Direct associations

  belongs_to :sport

  has_many   :fastest_times,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end

end
