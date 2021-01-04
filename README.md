# テーブル設計

## users テーブル

| Column               | Type   | Option      |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth                | date   | null: false |

### Association

- has_many :items
- has_many :order

## items テーブル

| Column                      | Type       | Option                         |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| description                 | text       | null: false                    |
| category_id(active_hash)    | integer    | null: false                    |
| status_id(active_hash)      | integer    | null: false                    |
| ship_cost_id(active_hash)   | integer    | null: false                    |
| ship_source_id(active_hash) | integer    | null: false                    |
| ship_date_id(active_hash)   | integer    | null: false                    |
| price                       | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## orders テーブル

| Column                     | Type       | Option                         |
| -------------------------- | ---------- | ------------------------------ |
| zip                        | string     | null: false                    |
| prefecture_id(active_hash) | integer    | null: false                    |
| city                       | string     | null: false                    |
| block                      | string     | null: false                    |
| building                   | string     |                                |
| phone                      | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |
| purchase                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :order