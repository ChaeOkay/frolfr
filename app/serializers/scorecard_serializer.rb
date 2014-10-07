class ScorecardSerializer < ActiveModel::Serializer
  attributes :id, :user_id

  has_one :round
end
