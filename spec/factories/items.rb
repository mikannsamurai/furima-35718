FactoryBot.define do
  factory :item do
    name              { 'あああああ' }
    text              { 'あああああああああ' }
    price             { 1111 }
    category_id       { 2 }
    product_condition_id { 3 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 22 }
    estimated_shipping_date_id { 2 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
