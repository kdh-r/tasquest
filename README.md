# tasquest レベルアップ型タスク管理ツール 


# 機能一覧

- ユーザー登録機能、ログイン機能（devise)
- タスク投稿機能（投稿、完了）
- レベルアップ機能


# 挙動説明

- リストリストを作成ボタンから10文字でタスクを登録後、一覧に表示されます。
- 一覧のタスクをクリックすると達成度を1〜3で選択
- 選択した達成度に応じた経験値を手に入れる
- 経験値が域値を超えるとレベルアップ


# トップページ
![サンプル](https://user-images.githubusercontent.com/69668590/96103252-70ba0800-0f12-11eb-8196-88edd73de4f2.png)


# 使用技術

<p text-align="center">
<img src="https://user-images.githubusercontent.com/69668590/95661785-09483500-0b6d-11eb-8dcb-fea9eb23011a.png" >

<img src="https://user-images.githubusercontent.com/69668590/95662341-44e4fe00-0b71-11eb-88d3-bddcc2437431.jpg" height="120px;" >

<img src="https://user-images.githubusercontent.com/69668590/95669153-353cd800-0bb8-11eb-883c-aac159f1a3b8.jpeg" height="160px;" >
</p>

# 制作背景
日々のめんどくさいタスクをこなした時にレベルアップすることによって、成果が可視化されモチベーションをあげてもらいたいという背景で作成しました




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




