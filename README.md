## users テーブル

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|name                |string |null: false, unique: true|
|email               |string |null: false, unique: true|
|encrypted_password  |string |null: false              |
|first_name          |string |null: false              |
|last_name           |string |null: false              |
|first_name_kana     |string |null: false              |
|last_name_kana      |string |null: false              |
|birthday            |date   |null: false              |

### Association

- has_many :items
- has_many :destinations
- has_many :purchase_historys

## items テーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|name         |string    |null: false                   |
|description  |text      |null: false                   |
|price        |integer   |null: false                   |
|category_id  |integer   |null: false                   |
|stats_id     |integer   |null: false                   |
|burden_id    |integer   |null: false                   |
|prefecture_id|integer   |null: false                   |
|shipment_id  |integer   |null: false                   |
|user         |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :destination
- has_many_active_hash :categorys
- has_many_active_hash :stats
- has_many_active_hash :burdens
- has_many_active_hash :prefectures
- has_many_active_hash :shipments

## destinations テーブル

|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|postal_code    |string    |null: false                   |
|prefectures_id |string    |null: false                   |
|municipality   |string    |null: false                   |
|address        |string    |null: false                   |
|building       |string    |                              |
|phone_number   |string    |null: false                   |
|user           |references|null: false, foreign_key: true|
|item         |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_many_active_hash :prefectures

## purchase_historys テーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :destination