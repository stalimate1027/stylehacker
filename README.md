# _stylehacker0_

### このアプリケーションはスケジュールを管理するアプリケーションです。  ユーザーはスケジュールを新規に登録することができ、1つのスケジュールには細かいタスクを登録することができます。

### _URL_  https://stylehacker0.herokuapp.com/

### テスト用アカウント  email test111@test.com  password test111

### 利用方法  ログイン後、トップページ右上の「New Schedule」をクリックすることで各項目後新規スケジュールを作成できます。  作成したスケジュールはトップページに表示されます。  トップページに表示されたスケジュールをクリックするとスケジュールの詳細ページに遷移します。  スケジュールの詳細ページには作成したスケジュールの詳細確認と編集と削除ができます。  また、スケジュールにはスケジュール内に細かいタスクを作成することができます。作成したタスクはスケジュール詳細画面にのみ表示され、トップページには表示されません。また、タスクに関してはスケジュールを削除した段階で削除されます。

### 目指した課題解決  社会人になって間もない年代で覚えることの多い若手社員を想定しております。  覚える優先順位や期限を整理しづらいという問題の解決を目指しました。

### 洗い出した要件  【ボタン】  サインアップ・サインインページへ遷移できるボタンがある。  ログイン時はログアウトできるボタンがある。  新規スケジュールを作成できるボタンがある。  スケジュール詳細ページにはスケジュールの変更・削除・新規タスク作成できるボタンがある。  【表示】  作成されたスケジュールは一覧でみることができる。  スケジュール詳細ページでは作成されたタスクを一覧でみることができる。

### 今後実装予定の機能  【フレンド機能】ユーザー同士の紐付けを行える様にする。  【公開範囲の制限機能】紐付けされたユーザー間でのみスケジュール・タスクの公開がされる様にする。  【JavaScript】削除に関しては非同期通信で簡単に行える様にする。

## テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

#### Association

- has_many :schedules
- has_many :comments


### schedules テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date_id       | date       | null: false                    |
| time_id       | integer    | null: false                    |
| text          | text       |                                |
| importance_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

#### Association
- has_many :comments
- has_many :sub_schedules
- belongs_to :user


### sub_schedules テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date_id       | integer    | null: false                    |
| time_id       | integer    |                                |
| text          | text       |                                |
| importance_id | integer    | null: false                    |
| schedule      | references | null: false, foreign_key: true |

#### Association
- belongs_to :schedule
- has_many :comments


### comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| schedule     | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :schedule


## ER図

#### [![Image from Gyazo](https://i.gyazo.com/0eeee3504fb776e6efab1845d8c471cb.png)](https://gyazo.com/0eeee3504fb776e6efab1845d8c471cb)