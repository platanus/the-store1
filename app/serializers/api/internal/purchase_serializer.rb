class Api::Internal::PurchaseSerializer < ActiveModel::Serializer
  type :purchase

  belongs_to :user
  belongs_to :item
  belongs_to :delivery_company

  attributes(
    :id,
    :status,
    :purchase_date,
    :created_at,
    :updated_at
  )
end
