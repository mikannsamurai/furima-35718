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
| birthday_year         | string   | null:false       |
| birthday_month        | string   | null:false       |
| birthday_day          | string   | null:false       |

### Association

- has_many :items
- has_one  :buyers

## items テーブル

| Column                  | Type       | Option                        |
| ----------------------- | ---------- | ------------------------------|
| image                   | string     | null:false                    |
| text                    | text       | null:false                    |
| price                   | integer    | null:false                    |
| category                | string     | null:false                    |
| product_condition       | string     | null:false                    |
| shipping_fee_burden     | string     | null:false                    |
| shipping_area           | string     | null:false                    |
| estimated shipping date | date       | null:false                    |
| user                    | references | null:false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- has_one    :buyer

## comment テーブル

| Column                  | Type       | Option                        |
| ----------------------- | ---------- | ----------------------------- |
| text                    | text       | null:false                    |
| user                    | references | null:false, foreign_key: true |
| item                    | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## buyers テーブル

| Column                        | Type       | Option                        |
| ----------------------------- | ---------- | ----------------------------- |
| credit_card_number            | string     | null:false                    |
| credit_card_deadline          | string     | null:false                    |
| credet_card_security_code     | string     | null:false                    |
| prefectures                   | string     | null:false                    |
| municipalities                | string     | null:false                    |
| address_1                     | text       | null:false                    |
| address_2                     | text       | null:true                     |
| Building name and room number | text       | null:true                     |
| user                          | string     | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item