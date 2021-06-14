FactoryBot.define do
  factory :buyer_product_purchase_management do

    prefecture_id           { 1 }
    municipalities          { '大阪府' }
    address                 { '大阪市堂山町' }
    building_name_and_room_number { '大山ビル' }
    postal_coke             { '999-9999' }
    phone_number            { '9999999999' }
    token                   { "tok_abcdefg00000000000000000"}

  end
end