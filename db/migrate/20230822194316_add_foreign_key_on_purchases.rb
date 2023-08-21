class AddForeignKeyOnPurchases < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :purchases, :delivery_companies, validate: false
  end
end
