class AddDeliveryCompanyToPurchase < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :purchases, :delivery_company, index: {algorithm: :concurrently}
  end
end
