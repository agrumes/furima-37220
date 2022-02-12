# テーブル設計

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| delivery_charge    | integer    | null: false                    |
| area               | integer    | null: false                    |
| delivery_days      | integer    | null: false                    |
| price              | integer    | null: false                    |
| users_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchases


## purchasesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :address


## addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchases