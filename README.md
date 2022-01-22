## usersテーブル
____
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | strings    | null: false,                   |
| email               | strings    | null: false, unique: true      |
| encrypted_password  | strings    | null: false,                   |
| last_name           | strings    | null: false,                   |
| first_name          | strings    | null: false,                   |
| last_name_kana      | strings    | null: false,                   |
| first_name_kana     | strings    | null: false,                   |
| birth_date          | text       | null: false,                   |

### Association
- has_many :items
- has_one :purchaser

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | strings    | null: false,                   |
| info                | text       | null: false,                   |
| category            | strings    | null: false,                   |
| sales_status        | strings    | null: false,                   |
| shipping_fee_status | strings    | null: false,                   |
| prefecture          | strings    | null: false,                   |
| scheduled_delivery  | strings    | null: false,                   |
| price               | integer    | null: false,                   |
| user                | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchaser

## purchaserテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | strings    | null: false,                   |
| prefecture          | strings    | null: false,                   |
| city                | strings    | null: false,                   |
| addresses           | strings    | null: false,                   |
| building            | strings    |                                |
| phone_number        | strings    | null: false,                   |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item