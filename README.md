# README

## users テーブル

| Column                | Type     | Options          |
| ---------------------   --------   ---------------- |
| nickname              | string   | null:false       |
| email                 | string   | null:false       |
| encrypted_password    | string   | null:false       |
| first_name_full_width | string   | null:false       |
| last_name_full_width  | string   | null:false       |
| first_name_katakana   | string   | null:false       |
| birthday              | date     | null:false       |


### Association

- has_many :items
- has_one  :buyer
- has_one  :product_purchase_management

## items テーブル

| Column                     | Type       | Option                        |
| -------------------------- | ---------- | ------------------------------|
| text                       | text       | null:false                    |
| price                      | integer    | null:false                    |
| category_id                | integer    | null:false                    |
| product_condition_id       | integer    | null:false                    |
| shipping_fee_burden_id     | integer    | null:false                    |
| shipping_area_id           | integer    | null:false                    |
| estimated shipping date_id | integer    | null:false                    |
| user                       | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer
- has_one    :product_purchase_management

## product_purchase_management テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

- belongs_to :user
- belongs_to :item

### Association

- belongs_to :user
- has_one    :item

## buyers テーブル

| Column                        | Type       | Option                        |
| ----------------------------- | ---------- | ----------------------------- |
| prefectures_id                | integer    | null:false                    |
| municipalities                | string     | null:false                    |
| address_1                     | string     | null:false                    |
| address_2                     | string     | null:true                     |
| building_name_and_room_number | string     | null:true                     |
| user                          | string     | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item