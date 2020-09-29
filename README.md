# タスク管理ツール


## users テーブル

| Column     | Type   | Options                |
| -----------| ------ | -----------------------|
| name       | string | null: false            |
| email      | string | null: false            |
| password   | string | null: false            |
|player_level|integer | null: false, default: 1|
| exp        |integer | null: false, default: 0|

## Association

- has_many :tasks


## tasks テーブル

| Column | Type       | Options                        |
|--------| ---------- | ------------------------------ |
|content | string     | null: false                    |
|user    | references | null: false, foreign_key: true |
|point   |integer     | null: false, default: 1        |

## Association

- belongs_to :user

## レベルテーブル

| Column  | Type       | Options                        |
|---------| ---------- | ------------------------------ |
| level   | integer    |                                |
|threshold| integer    |                                |

# 機能一覧

- ユーザー登録機能、ログイン機能（devise)
- タスク投稿機能
- レベルアップ機能