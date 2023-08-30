class Api::Internal::DeliveryCompanySerializer < ActiveModel::Serializer
  type :delivery_company

  attributes(
    :id,
    :name,
    :phone_number
  )
end
