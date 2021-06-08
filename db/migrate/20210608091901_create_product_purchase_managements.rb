class CreateProductPurchaseManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_managements do |t|

      t.timestamps
    end
  end
end
