# README

# テーブル設計

## user テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| family_name        | string | null: false  |
| second_name        | string | null: false  |
| reader_family_name | string | null: false  |
| reader_second_name | string | null: false  |
| birthday           | date   | null: false  |


### Association

-has_many :products
-has_many :comments
-has_many :purchase_histories

## product テーブル

| Column                     | Type      | Options           | default     |
| -------------------------- | --------- | ----------------- |-------------|
| zip_code                   | string    | null :false       |             |
| prefectures                | integer   | null :false       |             |
| municipalities             | string    | null :false       |             |
| block                      | string    | null :false       |             |
| building_name              | string    | null :false       |             |
| price                      | integer   | null :false       |             |
| phone_number               | integer   | null :false       |             |
| category_id                | integer   | null: false       | active_hash |
| product_condition_id       | integer   | null: false       | active_hash |
| shipping_charges_id        | integer   | null: false       | active_hash |
| estimated_shipping-date_id | integer   | null: false       | active_hash |
| product_id                 | string    | null: false       | active_hash |
| price_id                   | integer   | null: false       | active_hash |
| text                       | text      | null: false       |             |
| user                       | references| foreign-key :true |             |

### Association

-belongs_to :user
-has_many   :comments
-has_one   :purchase_history


## comment テーブル

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
| products    | references  | foreign_key :true    |
| user        | references  | foreign_key :true    |

## Association

-belongs_to :user
-belongs_to :product
-belongs_to :user_address

## user_addresses　テーブル

| Column                  | Type       | Options             | default
| ----------------------- | ---------  | --------------------| ----------
| zip_code                | string     | null: false         |
| prefectures             | integer    | null: false         | Active Hash
| municipality            | string     | null: false         |
| address                 | string     | null: false         |
| building_name           | string     |                     |
| price                   | integer    | null: false         |
| phone_number            | string     | null: false         |
| purchase_histories      |references  | foreign_key :true   |

### Association

-belongs_to    :purchase_histories