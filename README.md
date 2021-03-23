# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| mail-address       | text   | null: false |
| password           | string | null: false |
| encrypted-password | string | null: false |
| name               | string | null: false |
| reader-name        | string | null: false |
| family-name        | string | null: false |
| reader-family_name | string | null: false |
| birthday           | string | null: false |


### Association

-has_many :products
-has_many :comments
-has_one  :credit_card

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
-has_one    :credit_card
-has_one    :user_address


## comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | text       | null: false       |
| user        | references | foreign_key :true |
| product     | references | foreign_key :true |

### Association

-belongs_to :user
-belongs_to :product

## credit_cards テーブル　

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| card_info      | text       | null: false       |　
| expiration-date| references | foreign_key :true |
| security-code  | references | foreign_key :true |

## Association

-has_one    :user
-belongs_to :user_address

## user_address　テーブル

| Column                  | Type      | Options           | default
| ----------------------- | --------- | ----------------- | ----------
| Zip-code                | string    | null: false       |
| Prefectures             | text      | null: false       | Active Hash
| Municipality            | string    | null: false       |
| address                 | string    | null: false       |
| building-name            | string    | null: false      |
| phone_number            | string    | null: false       |

### Association

-belongs_to :user
-has_one    :credit_card