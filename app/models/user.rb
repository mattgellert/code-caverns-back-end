class User < ApplicationRecord
  has_many :challenges, through: :game
end
