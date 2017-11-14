class Challenge < ApplicationRecord
  has_one :user, through: :game
end
