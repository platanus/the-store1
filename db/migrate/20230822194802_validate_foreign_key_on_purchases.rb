class ValidateForeignKeyOnPurchases < ActiveRecord::Migration[6.1]
  def change
    validate_foreign_key :purchases, :delivery_companies
  end
end
