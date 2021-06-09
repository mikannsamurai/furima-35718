class CreateBuyerForms < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_forms do |t|

      t.timestamps
    end
  end
end
