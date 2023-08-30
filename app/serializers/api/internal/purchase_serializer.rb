class Api::Internal::PurchaseSerializer < ActiveModel::Serializer
  type :purchase

  belongs_to :user
  belongs_to :item
  belongs_to :delivery_company

  attributes(
    :id,
    :status,
    :created_at,
    :updated_at
  )
end
