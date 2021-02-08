## users テーブル

|Column    |Type   |Options    |
|----------|-------|-----------|
|name      |string |null: false|
|email     |string |null: false|
|password  |string |null: false|
|first_name|string |null: false|
|last_name |string |null: false|
|birthday  |integer|null: false|

### Association

- has_many :items
- has_many :purchases 

## items テーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|name    |string    |null: false                   |
|price   |integer   |null: false                   |
|category|string    |null: false                   |
|stats   |string    |null: false                   |
|burden  |string    |null: false                   |
|area    |string    |null: false                   |
|shipment|string    |null: false                   |
|user_id |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

|Column      |Type       |Options                      |
|------------|----------|------------------------------|
|postal_code |integer   |null: false                   |
|prefectures |string    |null: false                   |
|municipality|string    |null: false                   |
|address     |string    |null: false                   |
|building    |string    |null: false                   |
|phone_number|integer   |null: false                   |
|user_id     |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item