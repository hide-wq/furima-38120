## user

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| nickname              | string              | null: false               |
| email                 | string              | null: false, unique: true |
| encrypted_password    | string              | null: false               |
| password_confirmation | string              | null: false               |
| last_name             | string              | null: false               |
| first_name            | string              | null: false               |
| last_name_kana        | string              | null: false               |
| first_name_kana       | string              | null: false               |
| birthday_date1        | integer             | null: false               |
| birthday_date2        | integer             | null: false               |
| birthday_date3        | integer             | null: false               |

### Association

- has_many :items
- has_one :pay_form

## items

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| user                  | integer             | null: false, foreign_key: true|
| image                 | text                | null; false                   |
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
- has_one :pay_form

## pay_form

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| user                  | integer             | null: false, foreign_key: true|
| items                 | integer             | null: false, foreign_key: true|
| number                | integer             | null: false                   |
| exp_month             | integer             | null: false                   |
| exp_year              | integer             | null: false                   |
| cvc                   | integer             | null: false                   |
| postal_code           | integer             | null: false                   |
| prefecture            | integer             | null: false                   |
| city                  | string              | null: false                   |
| addresses             | string              | null: false                   |
| building              | string              |                               |
| phone_number          | integer             | null: false                   |

- belongs_to :user
- belongs_to :items