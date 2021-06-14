class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer :prefecture_id,    null:false
      t.string :municipalities,    null:false
      t.string :address,           null:false
      t.string :building_name_and_room_number
      t.string :product_purchase_management_id,   null:false
      t.string :postal_coke,       null:false
      t.string :phone_number,      null:false

      t.timestamps
    end
  end
end
