# README

# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| name               | string | null: false  |
| family_name        | string | null: false  |
| second_name        | string | null: false  |
| reader_family_name | string | null: false  |
| reader_second_name | string | null: false  |
| birthday           | date   | null: false  |


### Association

-has_many :products
-has_many :comments
-has_many :purchase_history

## products テーブル

| Column                     | Type      | Options           | default     |
| -------------------------- | --------- | ----------------- |-------------|
| seller                     | string    | null: false       |             |
| category_id                | integer   | null: false       | active_hash |
| product_condition_id       | integer   | null: false       | active_hash |
| shipping_charges_id        | integer   | null: false       | active_hash |
| estimated_shipping-date_id | integer   | null: false       | active_hash |
| product_name               | string    | null: false       |             |
| product_price              | string    | null: false       |             |
| text                       | string    | null: false       |             |
| user                       | references| foreign-key :true |             |

### Association

-belongs_to :user
-has_many   :comments
-has_many   :purchase_history


## comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | text       | null: false       |
| user        | references | foreign_key :true |
| product     | references | foreign_key :true |

### Association

-belongs_to :user
-belongs_to :product

##  purchase_history　テーブル　

| Column      | Type        | Options              |
| ----------- | ----------- | -------------------- |
| item_id     | references  | foreign_key :true    |
| user_id     | references  | foreign_key :true    |

## Association

-belongs_to :user
-belongs_t  :products

## user_address　テーブル

| Column                  | Type      | Options           | default
| ----------------------- | --------- | ----------------- | ----------
| zip_code                | string    | null: false       |
| prefectures             | text      | null: false       | Active Hash
| municipality            | string    | null: false       |
| address                 | string    | null: false       |
| building_name           | string    | null: false       |
| phone_number            | string    | null: false       |

### Association

-belongs_to    :users