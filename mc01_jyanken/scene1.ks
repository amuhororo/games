[hidemenubutton]
[cm]
[freeimage layer=1]
@clearfix

[iscript]
//セリフ関係
//rand/judge/r/hint

var hint = [];
//攻撃
hint[0] = [
	//最初
	['いっくよーー！',''],
	//勝ち
	['やるね！お返ししちゃうよ！',
	'いたた・・・まだまだこれから！',
	'やられっぱなしじゃないよ！'],
	//負け
	['どう？結構キツイでしょ？',
	'ほら、休んでる暇ないよー！',
	'ふふっ、その技は見切った！'],
	//引き分け
	['浅かったかな、よしもう一回！',
	'にらめっこしてても仕方ないね',
	'ゆうこちゃん、意外とやるね！']
];

//防御
hint[1] = [
	//最初
	['さぁ、かかってこーい！',''],
	//勝ち
	['なんか調子出ないなぁ・・・',
	'うう・・・もちょっと慎重にいこうかな',
	'いたた・・・なかなかやるね・・・'],
	//負け
	['ごめんね、大丈夫？',
	'攻めないと勝てないよ？',
	'ちょっとやりすぎちゃったかな・・・'],
	//引き分け
	['それじゃわたしには勝てないよ',
	'どうしたの？かかっておいでよ',
	'大技はスキができやすいんだよね']
];

//必殺
hint[2] = [
	//最初
	['最初から全力で行くよ！',''],
	//勝ち
	['よーし、こっちも本気出しちゃうよっ！',
	'さすがだね、もう手加減しないよ？',
	'次は全力で決める!！！'],
	//負け
	['もう一回同じのいくよ！',
	'この調子でガンガンいくよ！',
	'調子出てきたーー！'],
	//引き分け
	['そろそろ本気だす！',
	'持久戦は好きじゃないんだ',
	'早く決着つけたいよね？']
];

//結果テキスト
//judge/r
var log = [];
log[1] = [
	'ゆうこの攻撃！',
	'はるこの必殺技！しかしゆうこはかわして反撃！',
	'ゆうこの必殺技が炸裂！'
];
log[2] = [
	'はるこの必殺技が炸裂！',
	'はるこの攻撃！',
	'ゆうこの必殺技！しかしはるこはかわして反撃！'
];
log[3] = [
	'両者の攻撃で相打ち！',
	'互いに守りの姿勢！',
	'双方の必殺技が炸裂！相打ち！'
];
tf.hint = hint;
tf.log = log;
[endscript]


;//解説フラグ、なかったら作る
;[if exp="!sf.info"]
;@eval exp="sf.info = true"
;[endif]
;//戦闘回数。
@eval exp="tf.battlecount = 0"

;//背景
[bg storage="room.jpg" time="100"]

;//メッセージレイヤー
@layopt layer=message0 visible=true
@layopt layer=0 visible=true
[position layer="message0" left=20 top=470 width=920 height=150 page=fore visible=true margint="45" marginl="30" marginr="70" marginb="60"]
[ptext name="chara_name_area" layer="message0" color="white" size=24 x=50 y=480]
[chara_config ptext="chara_name_area"]

[button name="role_button" role="auto" graphic="auto.gif" x=850 y=480]

;//キャラセット
;yuko
[chara_new  name="yuko" storage="chara/yuko/normal.png" jname="ゆうこ"  ]
[chara_face name="yuko" face="ikari" storage="chara/yuko/ikari.png"]
[chara_face name="yuko" face="komaru" storage="chara/yuko/komaru.png"]
[chara_face name="yuko" face="nyaa" storage="chara/yuko/nyaa.png"]
[chara_face name="yuko" face="yokobo" storage="chara/yuko/yokobo.png"]
[chara_face name="yuko" face="yorokobu" storage="chara/yuko/yorokobu.png"]
[chara_face name="yuko" face="aozame" storage="chara/yuko/aozame.png"]

;haruko
[chara_new  name="haruko"  storage="chara/haruko/haruko.png" jname="はるこ" ]
[chara_face name="haruko" face="odoroku" storage="chara/haruko/odoroku.png"]
[chara_face name="haruko" face="komaru" storage="chara/haruko/komaru.png"]
[chara_face name="haruko" face="nyaa" storage="chara/haruko/nyaa.png"]
[chara_face name="haruko" face="yorokobu" storage="chara/haruko/yorokobu.png"]
[chara_face name="haruko" face="aozame" storage="chara/haruko/aozame.png"]
[chara_face name="haruko" face="gos" storage="chara/haruko/gos.png"]

;//ダメージ用キーフレアニメ
@eval exp="tf.swing_1 = 20";
@eval exp="tf.swing_2 = 20*2*-1;
[keyframe name="shake_re"]
[frame p=0% x="0" scaleX="-1"]
[frame p=25% x="&tf.swing_1" scaleX="-1"]
[frame p=75% x="&tf.swing_2" scaleX="-1"]
[frame p=100% x="&tf.swing_1" scaleX="-1"]
[endkeyframe]
[keyframe name="shake"]
[frame p=0% x="0"]
[frame p=25% x="&tf.swing_1"]
[frame p=75% x="&tf.swing_2"]
[frame p=100% x="&tf.swing_1"]
[endkeyframe]


;//回想
[if exp="tf.endlist !=''"]
;//キャラ登場
[chara_show name="yuko" left="50" top="110" zindex=2 reflect=true time=500]
[chara_show name="haruko" left="500" top="110" zindex=1 time=500]
[wa]
@eval exp="tf.endlist='*'+tf.endlist"
@jump target="&tf.endlist"
[endif]


;//オープニング
[if exp="sf.opskip != true"]
*op
[chara_show name="yuko" left="280" top="110" zindex=2]
#ゆうこ
はるこちゃーんどこー？一緒に帰ろうよ
[p]

[chara_show name="haruko" left="370" top="960" zindex=1 time=500]
[anim name=haruko top="110" time=300]
#はるこ
ここにいるよー[wa][p]

#ゆうこ
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
[anim name=yuko left="30" time=300]
わっ！びっくりした！・・・っていうか、なんで体操着？[p]

#はるこ
[chara_mod name="haruko" face="nyaa" time=1]
ゆうこちゃん勝負だ！[p]

#ゆうこ
[chara_mod name="yuko" face="ikari" reflect="true" time=1]
えーーーなんでーーー！？[p]
[else]
[chara_show name="yuko" left="-15" top="110" reflect=true time=100]
[chara_show name="haruko" left="565" top="110" time=100]
[endif]

*janken
[cm]

;//フラグがあったら表示
[if exp="sf.info!=true"]
#
「攻撃」は「防御」に勝ち、「防御」は「必殺」に勝ち、「必殺」は「攻撃」に勝ちます。[p]
はるこのセリフをヒントに行動を選択してください。
[glink color="black" size="20" x="auto" width="200" y="220" text="わかった" exp="sf.info=true" target="*chara_mod"]
[glink color="black" size="20" x="auto" width="200" y="300" text="もう一回！" exp="sf.info=false" target="*janken"]
[glink color="black" size="20" x="auto" width="200" y="380" text="後でまた教えて" exp="sf.info=false" target="*chara_mod"]
[s]
[endif]


;//キャラの表情と場所戻す
*chara_mod
[chara_mod name="yuko" face="default" reflect="true" time=1]
[chara_mod name="haruko" face="default" reflect="false" time=1]
[anim name=haruko left="565" time=500]
[anim name=yuko left="-15" time=500]

[wa]

;//初期値
@eval exp="tf.myHP=100"
@eval exp="tf.enHP=100"
@eval exp="tf.basedama=20"
@eval exp="tf.judge = 0"
@eval exp="tf.rand = 0"
@eval exp="tf.r = 0"

;//HPバーなど表示
[ptext layer=0 name="myname" text="ゆうこ" size=20 x=50 y=20]
[ptext layer=0 name="mybar" size=12 x=50 y=50 overwrite=true text=""]
[ptext layer=0 name="mycomand" size=64 x=280 y=80 overwrite=true text=""]

[ptext layer=0 name="enname" text="はるこ" size=20 x=510 y=20]
[ptext layer=0 name="enbar" size=12 x=510 y=50 overwrite=true text=""]
[ptext layer=0 name="encomand" size=64 x=510 y=80 overwrite=true text=""]

[wait time=1]

[iscript]
//HPバーと増えるアニメ
$('.mybar').append('<span class="hpbar"></span>');
$('.enbar').append('<span class="hpbar"></span>');
var num = 0;
var max = 100;
var newcount = setInterval(function(){
	if(num != max){
		if(max >= num){
				num++;
		}
		$(".mybar span").css("width",num + '%');
		$(".enbar span").css("width",num + '%');
	}else{
		clearInterval(newcount);
	}
}, 10);

[endscript]

@wait time=1500
@jump target="*start"
[s]


*start

;//どっちかのHPが0だったら終わる
[if exp="tf.myHP == 0 || tf.enHP == 0" ]
[glink color="black" size="20" x="auto" width="200" y="300" text="もう一回？" target="*janken"]
[glink color="black" size="20" x="auto" width="200" y="380" text="タイトルに戻る" target="*backtitle"]
[s]
[endif]


;//表情変更
[if exp="tf.myHP == tf.enHP"]
[chara_mod name="yuko" face="default" reflect="true" time=1]
[chara_mod name="haruko" face="default" time=1]

[elsif exp="tf.myHP > tf.enHP"]
[chara_mod name="yuko" face="yorokobu" reflect="true" time=1]
[chara_mod name="haruko" face="komaru" time=1]

[else]
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
[chara_mod name="haruko" face="yorokobu" time=1]
[endif]


[iscript]
//じゃんけん先に決めとく
tf.rand = Math.floor( Math.random() * 3);
tf.cmand = ['攻撃','防御','必殺'];
//var hint = Math.floor( Math.random() * 2);
//tf.hinttext = tf.hint[tf.rand][tf.judge][hint];

//選択コマンドクリア
$('.mycomand').html("");
$('.encomand').html("");

//ヒントメッセージ
tf.hinttext = tf.hint[tf.rand][tf.judge][tf.r];
[endscript]


;//選択肢＋ヒントメッセージ表示
#はるこ
@emb exp="tf.hinttext"
[glink name="radius" color="red" size="32" width=100 height=100 x="350" y="360" text="攻撃" exp="tf.r=0" target="*battle"]
[glink name="radius" color="red" size="32" width=100 height=100 x="430" y="240" text="必殺" exp="tf.r=2" target="*battle"]
[glink name="radius" color="red" size="32" width=100 height=100 x="510" y="360" text="防御" exp="tf.r=1" target="*battle"]
[s]

/* ただのメモ
攻撃時
攻撃 0-0 = 0 引き分け 双方ダメージ*0.5
防御 0-1 = -1 勝ち　ダメージ*1
必殺 0-2 = -2 負け　ダメージ*2

防御時
攻撃 1-0 = 1 負け　ダメージ*1
防御 1-1 = 0 引き分け　双方ダメージ0
必殺 1-2 = -1 勝ち　ダメージ*2

必殺時
攻撃 2-0 = 2 勝ち　ダメージ*2
防御 2-1 = 1 負け　ダメージ*2
必殺 2-2 = 0 引き分け 双方ダメージ*2
*/


*battle
[cm]
[iscript]
tf.battlecount++

//勝敗判定
if( tf.r - tf.rand == -1 || tf.r - tf.rand == 2 ){
	tf.judge = 1;
	tf.text = "勝ちました";
}else if( tf.r - tf.rand == -2 || tf.r - tf.rand == 1 ){
	tf.judge = 2;
	tf.text = "負けました";
}else{
	tf.judge = 3;
	tf.text = "引き分けました";
}
tf.logtext = tf.log[tf.judge][tf.r];


//選択コマンド表示
$('.mycomand').html(tf.cmand[tf.r]).css("color","#fff");
$('.encomand').html(tf.cmand[tf.rand]).css("color","#fff");
if(tf.judge == 1)$('.mycomand').css("color","#f66");
else if(tf.judge == 2)$('.encomand').css("color","#f66");
[endscript]

[wait time=500]

[iscript]
//ダメージ計算
if( tf.r == 0 ){
	if( tf.judge == 1 ) tf.dama = tf.basedama;
	else if( tf.judge == 2 ) tf.dama = tf.basedama * 2;
	else tf.dama = tf.basedama * 0.5;
}else if( tf.r == 1 ){
	if( tf.judge == 1 ) tf.dama = tf.basedama * 2;
	else if( tf.judge == 2 ) tf.dama = tf.basedama;
	else tf.dama = 0;
}else{
	tf.dama = tf.basedama * 2;
}

//元HPを一時保存
var myHP = tf.myHP;
var enHP = tf.enHP;


//ダメージ反映
if( tf.judge == 1 ){
	tf.enHP = tf.enHP - tf.dama;
}else if( tf.judge == 2 ){
	tf.myHP = tf.myHP - tf.dama;
}else if( tf.judge == 3 ){
	tf.myHP = tf.myHP - tf.dama;
	tf.enHP = tf.enHP - tf.dama;
}else{
	tf.myHP = tf.myHP;
	tf.enHP = tf.enHP;
}
if(tf.myHP<0)tf.myHP = 0;
if(tf.enHP<0)tf.enHP = 0;

*count
//HPバーカウントダウン
var speed = 10;
var mycount = setInterval(function(){
	if(myHP != tf.myHP){
		if(myHP >= tf.myHP){
			myHP--;
		}
		$(".mybar span").css("width",myHP + '%');
	}else{
		clearInterval(mycount);
	}
}, speed);
var encount = setInterval(function(){
	if(enHP != tf.enHP){
		if(enHP >= tf.enHP){
			enHP--;
		}
		$(".enbar span").css("width",enHP + '%');
	}else{
		clearInterval(encount);
	}
}, speed);

[endscript]

;//ダメージアニメ
[if exp="tf.judge==1"]
	[kanim name="haruko" keyframe="shake" count=5 time=50]
	[wa]
	[kanim name="haruko" keyframe="shake" count=0]
[elsif exp="tf.judge==2"]
	[kanim name="yuko" keyframe="shake_re" count=5 time=50]
	[wa]
	[kanim name="yuko" keyframe="shake_re" count=0]
[elsif exp="tf.judge==3 && tf.r!=1"]
	[kanim name="haruko" keyframe="shake" count=5 time=50]
	[kanim name="yuko" keyframe="shake_re" count=5 time=50]
	[wa]
	[kanim name="haruko" keyframe="shake" count=0]
	[kanim name="yuko" keyframe="shake_re" count=0]
[endif]

[wait time=1]


;//バトル後
#
@emb exp="tf.logtext"
[p]


;//ED
[if exp="tf.myHP == 0 && tf.enHP == 0"]
@eval exp="sf.end1=true"
@jump target="*end1"

[elsif exp="tf.myHP == 0 && tf.enHP == 100" ]
@eval exp="sf.end2=true"
@jump target="*end2"

[elsif exp="tf.myHP == 0" ]
@eval exp="sf.end3=true"
@jump target="*end3"

[elsif exp="tf.enHP == 0 && tf.myHP >= 80" ]
@eval exp="sf.end4=true"
@jump target="*end4"

[elsif exp="tf.enHP == 0" ]
@eval exp="sf.end5=true"
@jump target="*end5"

[endif]

*jump_s
#
@jump target="*start"

[s]


*end1
;//引き分け
#はるこ
[chara_mod name="haruko" face="odoroku" time=1]
わたしと互角だなんて・・・[p]
[chara_mod name="haruko" face="yorokobu" time=1]
これからは、「強敵」と書いて「とも」と呼ぶね！！[p]
#ゆうこ
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
えぇーーー！！！
[p]
【END1 [ruby text="と"]強[ruby text="も"]敵】
[p]
@jump target="*next"
[s]


*end2
;//はるこ完全勝利
#はるこ
[chara_mod name="haruko" face="nyaa" time=1]
やったーー！完全勝利ーーーー！！！！[p]
#ゆうこ
[chara_mod name="yuko" face="yokobo" reflect="true" time=1]
はるこちゃんに敵うわけないよーー[p]
#はるこ
コスチュームチェーンジ！！！
[chara_mod name="haruko" face="gos" time=500]
[wait time=450]
[p]
#ゆうこ
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
（？？？？？？？？）
[p]
#はるこ
この調子なら勝てる！！魔王倒してくるね！！[p]
[chara_mod name="haruko" reflect="true" time=150]
[anim name=haruko left="1000" time=500]
[wa]
#ゆうこ
（えーー・・・・と・・・・・・？）
[p]
【END2 はるこのJOB】
[p]
@jump target="*next"
[s]

*end3
;//はるこ勝利
#はるこ
[chara_mod name="haruko" face="nyaa" time=1]
やったーー！私のかっちぃ～[p]
#ゆうこ
[chara_mod name="yuko" face="yokobo" reflect="true" time=1]
（・・・コレ何の勝負なんだろう・・・）
[p]
【END3 はるこ勝利】
[p]
@jump target="*next"
[s]

*end4
;//ゆうこ大差で勝利
#ゆうこ
[chara_mod name="yuko" face="nyaa" reflect="true" time=1]
やったー！はるこちゃんに勝ったーー！！[p]
#はるこ
[chara_mod name="haruko" face="aozame" time=1]
・・・・こんなに大差で負けるなんて・・・・・ぶつぶつ[p]
#ゆうこ
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
・・・・はるこちゃん？[p]
#はるこ
・・・もっと・・・もっと強くならなきゃ・・・ぶつぶつ[p]
#ゆうこ
[chara_mod name="yuko" face="aozame" reflect="true" time=1]
（あわわ・・・ど、どうしよう・・・）
[p]
【END4 はるこの目的とは】
[p]
@jump target="*next"
[s]

*end5
;//ゆうこ勝利
#ゆうこ
[chara_mod name="yuko" face="nyaa" reflect="true" time=1]
やったー！勝ったーー！！[p]
#はるこ
[chara_mod name="haruko" face="komaru" time=1]
ゆうこちゃんがこんなに強かったなんて！[p]
[chara_mod name="haruko" face="nyaa" time=1]
一緒に世界一を目指そうよ！[p]
#ゆうこ
[chara_mod name="yuko" face="komaru" reflect="true" time=1]
えっ！？何の？？？？？
[p]
【END5 目指すは世界一！】
[p]
@jump target="*next"
[s]

*next
[if exp="tf.endlist !=''"]
@jump target="*backtitle"
[else]
@jump target="*jump_s"
[endif]


*backtitle
[cm]
@layopt layer=message0 visible=false
[freeimage layer=0]
@clearfix
@jump storage=title.ks
[s]


[macro name=""]