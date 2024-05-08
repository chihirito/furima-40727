# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthdate          | date   | null: false |

### Association

-has_many :orders
-has_many :products


## products テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| image                        | string     | null: false                    |
| name                         | string     | null: false                    |
| description                  | text       | null: false                    |
| category                     | string     | null: false                    |
| condition                    | string     | null: false                    |
| shipping_fee_responsibility  | string     | null: false                    |
| origin_area                  | string     | null: false                    |
| shipping_duration            | integer    | null: false                    |
| user_id                      | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :order


## orders テーブル
| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| product_id                   | references | null: false, foreign_key: true |
| user_id                      | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :product
-has_one :shipment


## shipments テーブル
| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| postal_code                  | string     | null: false                    |
| prefecture                   | string     | null: false                    |
| city                         | string     | null: false                    |
| street_address               | string     | null: false                    |
| building_name                | string     |                                |
| phone_number                 | string     | null: false                    |
| order_id                     | references | null: false, foreign_key: true |

### Association

-belongs_to :order