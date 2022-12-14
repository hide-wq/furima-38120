# アプリケーション名
**フリマアプリ**

# アプリケーションの概要
- ユーザーを登録すると商品を出品できるようになります。<br>
- 自身が出品した商品は、編集と削除をすることができます。<br>
- 他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。<br>
（PAYJPというサービスを利用しています、実際のクレジットカードでの決済はご遠慮ください。）

# URL
**render**
<br>
https://furima-38120.onrender.com/

**Basic認証**
<br>
  ・ID: admin
<br>
  ・Pass: 2222


# テスト用アカウント

**出品者用のメールアドレスとパスワード**
<br>
・email: test1@co.jp
<br>
・pass: 123456a

**購入者用のメールアドレスとパスワード**
<br>
・email: test@co.jp
<br>
・pass: 123456a
<br>
**購入用カード情報（PAYJPを利用しています）**
<br>
・購入用カード情報(PAYJPテスト用)
<br>
・番号：4242424242424242
<br>
・期限：3月/（20）22年（未来の年月であれば可能）
<br>
・セキュリティコード：123
<br>

# 利用方法
<br>
トップページから、新規登録又は、ログインをお願いします。(登録無しの場合は閲覧のみになります）
<br>

**出品をする場合**
<br>
1.ログイン状態でトップページ下部の出品ボタンをクリックして下さい。
<br>
2.出品ページに画面遷移後、必要な情報を入力した上で出品ボタンを押すことで商品を登録できます。
<br>

**購入をする場合**
<br>
1.出品したアカウントとは別のアカウントをお使いください。
<br>
2.トップページから購入したい商品をクリックしてください。
<br>
3.購入ページへ画面遷移後、必要な情報を入力して購入ボタンを押すと商品の購入ができます。<br>
※PAYJPのサービスでテスト用のカード情報を記載しているのでそちらを利用して購入をお願いいたします。<br>


# アプリケーションを作成した背景	
<br>
PCやスマートフォンを持っている誰もが"簡単"にモノの売り買いを楽しめる様なプラットフォームを提供したいと考え作成しました。
<br>

# 洗い出した要件	
**Googleスプレッドシート**
<br>
https://docs.google.com/spreadsheets/d/1_uQ9LlyJbgjtApiYatuTQF5SThoF_pxec7dVqGXKq2I/edit#gid=1148367473

# 実装した機能についての画像やGIFおよびその説明

**トップページ**
<br>
![トップページ](https://user-images.githubusercontent.com/81303735/203698162-beeee228-3ef4-4150-be21-47e092814f34.gif)
<br>

**1.ユーザー登録機能**
<br>
ユーザー登録することで出品・購入できるようになります。（ユーザー登録していない人でも出品している商品を見ることは可能です。）<br>
![107143755-2acdf780-697a-11eb-9163-68e4d5e25643](https://user-images.githubusercontent.com/81303735/203698512-a13d13dc-8144-41d2-96a3-671890f4a898.gif)
<br>
**2.商品出品機能**
<br>
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）<br>
![107143777-420ce500-697a-11eb-8693-1bbff89abb6a](https://user-images.githubusercontent.com/81303735/203698587-29c6650a-ddf5-4392-a5a7-7f7538b9934d.gif)
<br>
**3.商品の編集機能**
<br>
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。<br>
![107143794-5c46c300-697a-11eb-8a3c-ff24c18f098c](https://user-images.githubusercontent.com/81303735/203698664-969e66ce-5ff5-4883-b276-3ba23a04c5d6.gif)
<br>
**4.商品の削除機能**
<br>
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。<br>
![商品削除機能](https://user-images.githubusercontent.com/81303735/203698733-505ceb7f-60d0-4a78-a469-a9eecac40fc2.gif)
<br>
**5.商品の購入機能**
<br>
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）<br>
![107143834-91531580-697a-11eb-8bc4-1eca1d49e97e](https://user-images.githubusercontent.com/81303735/203698770-15d4600a-7be3-43a8-bbbd-d0adab0cb688.gif)
<br>

# データベース設計

![test](https://user-images.githubusercontent.com/81303735/203699026-6bea0de1-9f02-4750-997b-dbccae7d149e.png)


# 洗い出した要件	
**Googleスプレッドシート**
<br>
https://docs.google.com/spreadsheets/d/1_uQ9LlyJbgjtApiYatuTQF5SThoF_pxec7dVqGXKq2I/edit#gid=1148367473


# 画面遷移図	

![画面遷移図](https://user-images.githubusercontent.com/81303735/203971267-39a6e36b-0863-4460-8f34-1b94ed821c1f.png)


# 開発環境
- ruby 2.6.5
- Rails 6.0.3.4
- MySQL 5.6.47
# ローカルでの動作方法
```
% git clone https://github.com/hide-wq/furima-38120.git
% cd furima-38120
% bundle install
% rails db:create
% rails db:migrate
% yarn install
```
# 工夫したポイント
- 開発の際にissueを分けることで作業内容・工程を明確化したところです。

