# タスク管理ツール

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association

- has_many :tasks


## tasks テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
|content | string     | null: false                    |
|user    | references | null: false, foreign_key: true |

## Association

- belongs_to :user