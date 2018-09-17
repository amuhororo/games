;一番最初に呼び出されるファイル

;[title name="ティラノスクリプト解説"]

[stop_keyconfig]
;メッセージボックスは非表示
@layopt layer="message" visible=false
@loadcss file="./data/others/card.css"


[html name="loading"]
<dl>
<dt></dt>
<dd>ロード中だよ…ちょっと待ってね！</dd>
</dl>
[endhtml]

;ティラノスクリプトが標準で用意している便利なライブラリ群
;コンフィグ、CG、回想モードを使う場合は必須
;@call storage="tyrano.ks"
;ゲームで必ず必要な初期化処理はこのファイルに記述するのがオススメ

[iscript]
  f.preload_images = [
    "data/image/card.png",
    "data/image/card_1.png",
    "data/image/card_2.png",
    "data/image/card_3.png",
    "data/image/card_4.png",
    "data/image/card_5.png",
    "data/image/card_6.png",
    "data/image/card_7.png",
    "data/image/card_8.png",
    "data/image/card_9.png",
    "data/image/card_10.png",
    "data/image/card_11.png",
    "data/image/card_12.png"
  ];
[endscript]
@preload storage=&f.preload_images

;最初は右下のメニューボタンを非表示にする
;[hidemenubutton]

;タイトル画面へ移動
@jump storage="title.ks"

[s]
