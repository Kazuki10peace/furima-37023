
## usersテーブル
____
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false,                   |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false,                   |
| last_name           | string     | null: false,                   |
| first_name          | string     | null: false,                   |
| last_name_kana      | string     | null: false,                   |
| first_name_kana     | string     | null: false,                   |
| birth_date          | date       | null: false,                   |

### Association
- has_many :items
- has_many :addresses
- has_many :order_histories

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false,                   |
| info                | text       | null: false,                   |
| categories          | integer    | null: false,                   |
| sales_status        | integer    | null: false,                   |
| shipping_fee_status | integer    | null: false,                   |
| prefectures         | integer    | null: false,                   |
| scheduled_deliveries| integer    | null: false,                   |
| price               | integer    | null: false,                   |
| user                | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :address

## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false,                   |
| prefectures         | integer    | null: false,                   |
| city                | string     | null: false,                   |
| addresses           | string     | null: false,                   |
| building            | string     |                                |
| phone_number        | string     | null: false,                   |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order_history

## order_historiesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :addresses