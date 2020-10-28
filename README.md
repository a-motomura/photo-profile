# README

# アプリケーション名	
 photo-profile

# アプリケーション概要	
 写真を投稿し、その写真の名前、ジャンル、紹介文、場所、その他の情報も一緒に投稿出来る

# URL	
デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。

[オリジナルアプリ](http://52.199.110.96/)

# テスト用アカウント
 user1 email:b1@gmail.com, password:q123456

 user2 email:b2@gmail.com, password:w234567

# 利用方法
 写真を投稿し、その内容を他のユーザーと共有出来る。

 また、投稿内容にコメントをする事でコミュニケーションを取れる。

 それぞれのユーザー事にアルバムがあり、投稿した写真が一覧出来る。

# 目指した課題解決
 写真が趣味の人同士のコミュニケーションツール

 また、何を撮影した写真かを忘れてしまった写真もコメントをもらう事で思い出す事も出来る。

# 洗い出した要件
  1.テーブル設計	
   -アプリ作成に必要なデーターベースを設計する

   -"ER図を書く

   -READMEにデーターベース設計を記述する

   -ER図はそれぞれのデーターベースの関係性が分かる様に作成する

   -データーベース設計はカラム名、アソシエーションをしっかりと記述する
   
  2.ユーザー管理機能
   -deviseを導入し、ユーザー管理機能を実装する

   -deviseを導入する

   -ユーザー管理機能を実装する

   -モデルの単体のテストコードを記述する"	"・「新規登録ボタン」をクリックしたら新規登録出来る

   -「ログインボタン」をクリックしたら、新規登録した内容でログインが出来る

   -「ログアウトボタン」をクリックしたら、ログアウト出来る
   
  3.投稿機能
   -ユーザーが投稿出来るようにする

   -画像/ジャンル/紹介文/場所などの情報の投稿を可能にする	"・画像は投稿されていることが前提

   -画像/ジャンル/紹介文/場所などを投稿出来る欄を儲ける

   -投稿した内容はトップページに表示する
   
  4.投稿編集機能	
   -ユーザーが投稿した投稿内容を編集出来るようにする

   -画像/ジャンル/紹介文/場所などの情報の編集を可能にする

   -投稿したユーザーのみ編集出来る
   
  5.投稿削除機能
   -ユーザーが投稿した投稿内容を削除出来るようにする

   -画像/ジャンル/紹介文/場所などの情報の削除を可能にする

   -投稿したユーザーのみ削除出来る
   
  6.コメント機能	
   -ユーザーが投稿した投稿内容にコメント出来るようにする	

   -ログインしているユーザーは投稿内容にコメントする事が出来る

   -ログインしているユーザーのみコメント出来る

# 実装した機能についてのGIFと説明
  機能毎にブランチを分けて作成している
  
 [github](https://github.com/a-motomura/photo-profile)

# 実装予定の機能
  1.プレビュー機能の実装

  2.コメントにも写真を投稿出来るようにする。

  3.フロント機能を充実させる。

# データベース設計
  [ER図](https://gyazo.com/e67241c981c333424ad735ea34034602)
  
# ローカルでの動作方法
 	% git clone https://github.com/a-motomura/photo-profile.git

# テーブル設計

## users テーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |

### Association

- has_many :tweets
- has_many :comments

## tweets テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| genre           | integer    | null: false                    |
| introduction    | text       | null: false                    |
| place           | text       |                                |
| other           | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_text    | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| tweet           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet