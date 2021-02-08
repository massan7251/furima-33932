## users テーブル

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|name                |string |null: false              |
|email               |string |null: false, unique: true|
|encrypted_password  |string |null: false              |
|first_name          |string |null: false              |
|last_name           |string |null: false              |
|first_name_kana     |string |null: false              |
|last_name_kana      |string |null: false              |
|birthday            |date   |null: false              |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|name         |string    |null: false                   |
|description  |text      |null: false                   |
|price        |integer   |null: false                   |
|category_id  |integer   |null: false                   |
|status_id    |integer   |null: false                   |
|burden_id    |integer   |null: false                   |
|prefecture_id|integer   |null: false                   |
|shipment_id  |integer   |null: false                   |
|user         |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :destination
- has_many_active_hash :category
- has_many_active_hash :status
- has_many_active_hash :burden
- has_many_active_hash :prefecture
- has_many_active_hash :shipment

## destinations テーブル

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|postal_code     |string    |null: false                   |
|prefectures_id  |integer   |null: false                   |
|municipality    |string    |null: false                   |
|address         |string    |null: false                   |
|building        |string    |                              |
|phone_number    |string    |null: false                   |
|purchase_history|references|null: false, foreign_key: true|

### Association

- belongs_to :purchase_history
- belongs_to_active_hash :prefecture

## purchase_histories テーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination