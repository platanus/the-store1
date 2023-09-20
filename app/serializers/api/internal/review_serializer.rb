class Api::Internal::ReviewSerializer < ActiveModel::Serializer
  type :review

  belongs_to :user

  attributes(
    :id,
    :comment,
    :created_at
  )
end
