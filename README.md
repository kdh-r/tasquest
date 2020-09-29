# レベルアップ型タスク管理ツール


## users テーブル

| Column       | Type       | Options                 |
| ------------ | ---------- | ----------------------- |
| name         | string     | null: false             |
| email        | string     | null: false             |
| password     | string     | null: false             |
| player_level | integer    | null: false, default: 1 |
| exp          | integer    | null: false, default: 0 |
| level_id     | references | foreign_key: true       |

## Association

- has_many :tasks
- belongs_to :level


## tasks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user_id | references | foreign_key: true              |
| point   | integer    | null: false, default: 1        |

## Association

- belongs_to :user


## レベルテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| number    | integer    |                                |
| threshold | integer    |                                |

## Association 

- has_many :users


# 機能一覧

- ユーザー登録機能、ログイン機能（devise)
- タスク投稿機能
- レベルアップ機能