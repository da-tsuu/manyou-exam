---
title: テーブル
tags: Markdown
slide: false
---
#### Users
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|name|string|
|e-mail|string|
|password_digest|string|

#### Tasks
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|user_id(FK)|references|
|title|string|
|content|text|
|deadline|date|
|priority|string|
|status|string|

#### labelings
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|task_id(FK)|references|
|label_id(FK)|references|

#### Labels
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|name|string|

---
title: hrokuへのデプロイ手順
tags: Markdown
---
## 準備
### config/environments/production.rbの設定
デフォルトでfalseとなっている以下の箇所をtrueに変更
```config.assets.compile = true```

### Herokuへのログイン　
` heroku login `
### ファイルをコミット対象にし、ソースをコミット 
`git add -A`
`git commit -m "Release to heroku"`

## Herokuアプリ作成
`heroku create`

## リモートリポジトリの確認・登録
`git remote`
リモートリポジトリherokuが存在しない場合は、heroku create <アプリ名>コマンド実行時に払い出されたgitリポジトリをリモートリポジトリherokuとして登録する

## デプロイ
`git push heroku master`
ローカルのmasterブランチをリモートリポジトリherokuへpushする
