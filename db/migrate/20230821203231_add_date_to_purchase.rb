class AddDateToPurchase < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :purchase_date, :date
  end
end
