# テーブル設計

## users テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth           | date       | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column                   | Type       | Option                         |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| description              | text       | null: false                    |
| category(active_hash)    | integer    | null: false                    |
| status(active_hash)      | integer    | null: false                    |
| ship_cost(active_hash)   | integer    | null: false                    |
| ship_source(active_hash) | integer    | null: false                    |
| ship_date(active_hash)   | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |
| order                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type    | Option                         |
| ---------- | ------- | ------------------------------ |
| zip        | string  | null: false                    |
| prefecture | string  | null: false                    |
| city       | string  | null: false                    |
| block      | string  | null: false                    |
| building   | string  |                                |
| phone      | string  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

