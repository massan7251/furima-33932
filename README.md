## users テーブル

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|name                |string |null: false, unique: true|
|email               |string |null: false              |
|encrypted_password  |string |null: false              |
|first_name          |string |null: false              |
|last_name           |string |null: false              |
|first_name_kana     |string |null: false              |
|last_name_kana      |string |null: false              |
|birthday            |date   |null: false              |

### Association

- has_many :items
- has_many :destinations
- has_many :urchase_historys

## items テーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|name          |string    |null: false                   |
|price         |integer   |null: false                   |
|category_id   |integer   |null: false                   |
|stats_id      |integer   |null: false                   |
|burden_id     |integer   |null: false                   |
|prefectures_id|integer   |null: false                   |
|shipment_id   |integer   |null: false                   |
|user          |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :destinations
- has_one :urchase_historys

## destinations テーブル

|Column      |Type       |Options                      |
|------------|----------|------------------------------|
|postal_code |string    |null: false                   |
|prefectures |string    |null: false                   |
|municipality|string    |null: false                   |
|address     |string    |null: false                   |
|building    |string    |null: false                   |
|phone_number|string    |null: false                   |
|user        |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchase_historys テーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to user
- berongs_to item