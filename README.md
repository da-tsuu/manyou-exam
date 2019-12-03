---
title: 【markdown】テーブル書き方
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
