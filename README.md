# stylehacker テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :schedules
- has_many :comments


## schedules テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date_id       | integer    | null: false                    |
| time_id       | integer    |                                |
| text          | text       |                                |
| importance_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_many :sub_schedules
- belongs_to :user


## sub_schedules テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date_id       | integer    | null: false                    |
| time_id       | integer    |                                |
| text          | text       |                                |
| importance_id | integer    | null: false                    |
| schedule      | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule
- has_many :comments


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| schedule     | references | null: false, foreign_key: true |
| sub_schedule | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :schedule
- belongs_to :sub_schedule