class GameSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :challenge
end
