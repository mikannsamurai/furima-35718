# README

## users テーブル

| Column                | Type     | Options                  |
| ---------------------   --------   ------------------------ |
| nickname              | string   | null:false               |
| email                 | string   | null:false, unique: true |
| encrypted_password    | string   | null:false               |
| first_name_full_width | string   | null:false               |
| last_name_full_width  | string   | null:false               |
| first_name_katakana   | string   | null:false               |
| last_name_katakana    | string   | null:false               |
| birthday              | date     | null:false               |


### Association

- has_many :items
- has_many  :product_purchase_managements

## items テーブル

| Column                     | Type       | Option                        |
| -------------------------- | ---------- | ------------------------------|
| name                       | string     | null:false                    |
| text                       | text       | null:false                    |
| price                      | integer    | null:false                    |
| category_id                | integer    | null:false                    |
| product_condition_id       | integer    | null:false                    |
| shipping_fee_burden_id     | integer    | null:false                    |
| prefecture_id              | integer    | null:false                    |
| estimated_shipping_date_id | integer    | null:false                    |
| user                       | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :product_purchase_management

## product_purchase_management テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association

belongs_to :user 
belongs_to :item
has_one    :order

## order テーブル

| Column                        | Type       | Option                        |
| ----------------------------- | ---------- | ----------------------------- |
| prefecture_id                 | integer    | null:false                    |
| municipalities                | string     | null:false                    |
| address                       | string     | null:false                    |
| building_name_and_room_number | string     | null:true                     |
| product_purchase_management   | references | null:false, foreign_key: true |
| postal_coke                   | string     | null:false                    |
| phone_number                  | string     | null:false                    |

### Association

- belongs_to :product_purchase_management