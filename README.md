# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| family_name        | string | null: false |
| second_name        | string | null: false |
| reader_family_nam  | string | null: false |
| reader_second_name | string | null: false |
| birthday           | date   | null: false |


### Association

-has_many :products
-has_many :comments
-has_many :user_address
-has_many :purchase_history

## products テーブル

| Column                  | Type      | Options           |
| ----------------------- | --------- | ----------------- |
| seller                  | string    | null: false       |
| category                | text      | null: false       |
| product-condition       | string    | null: false       |
| shipping-charges        | string    | null: false       |
| estimated-shipping-date | string    | null: false       |
| product-name            | string    | null: false       |
| product-image           | string    | null: false       |
| product-price           | string    | null: false       |
| text                    | string    | null: false       |
| user                    | references| foreign-key :true |

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
| zip-code                | string    | null: false       |
| prefectures             | text      | null: false       | Active Hash
| municipality            | string    | null: false       |
| address                 | string    | null: false       |
| building-name           | string    | null: false       |
| phone-number            | string    | null: false       |

### Association

-belongs_to    :users