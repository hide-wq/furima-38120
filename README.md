## users

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| nickname              | string              | null: false               |
| email                 | string              | null: false, unique: true |
| encrypted_password    | string              | null: false               |
| last_name             | string              | null: false               |
| first_name            | string              | null: false               |
| last_name_kana        | string              | null: false               |
| first_name_kana       | string              | null: false               |
| birthday              | date                | null: false               |

### Association

- has_many :items
- has_many :Purchase_historys

## items

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| user                  | references          | null: false, foreign_key: true|
| name                  | string              | null: false                   |
| info                  | text                | null: false                   |
| category_id           | integer             | null: false                   |
| sales_status_id       | integer             | null: false                   |
| shipping_fee_status_id| integer             | null: false                   |
| prefecture_id         | integer             | null: false                   |
| scheduled_delivery_id | integer             | null: false                   |
| price                 | integer             | null: false                   |

### Association

- belongs_to :user
- belongs_to :pay_forms
- has_one :Purchase_historys


## pay_forms

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| number                | integer             | null: false                   |
| exp_month             | integer             | null: false                   |
| exp_year              | integer             | null: false                   |
| cvc                   | integer             | null: false                   |

### Association

- belongs_to :addresses
- belongs_to :items

## addresses

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| postal_code           | string              | null: false                   |
| prefecture_id         | integer             | null: false                   |
| city                  | string              | null: false                   |
| addresses             | string              | null: false                   |
| building              | string              |                               |
| phone_number          | string              | null: false                   |

### Association

- belongs_to :pay_forms
- has_one :Purchase_historys

## Purchase_historys
| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| user                  | references          | null: false, foreign_key: true|
| items                 | references          | null: false, foreign_key: true|

### Association

- has_many :users
- belongs_to :items
- belongs_to :addresses