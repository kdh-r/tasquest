# レベルアップ型タスク管理ツール


## users テーブル

| Column       | Type       | Options                 |
| ------------ | ---------- | ----------------------- |
| name         | string     | null: false             |
| email        | string     | null: false             |
| password     | string     | null: false             |
| player_level | integer    | null: false, default: 1 |


## Association

- has_many :tasks



## tasks テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| content    | string     | null: false                    |
| user_id    | references | foreign_key: true              |
| point_id   | integer    | null: false, default: 1        |

## Association

- belongs_to :user


## レベルテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| number    | integer    |                                |
| threshold | integer    |                                |

## Association 




# 機能一覧

- ユーザー登録機能、ログイン機能（devise)
- タスク投稿機能
- レベルアップ機能