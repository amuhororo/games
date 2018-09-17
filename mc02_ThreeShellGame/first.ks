;一番最初に呼び出されるファイル
	@hidemenubutton

	[iscript]
		sf.game_title = TG.config["System.title"] + "　" + sf.game_ver
	[endscript]
	@title name=&sf.game_title
	
	@stop_keyconfig
	@layopt layer="message" visible=false


;改造タグ読み込み。センタリング反映の為先に呼ぶ。
	@loadjs storage="js/kag.tag_remode.js"

;ブラウザの場合の画面サイズ変更とかをちょっと待つ
	@wait time=150


;なうろーでぃんぐ
	@layopt layer=1 visible=true
	@image storage="loading.png" name="loading" layer=1 x="center" y="center" width=200 height=200
	[keyframe name="loading"]
		@frame p=100% rotate="360deg"
	[endkeyframe]
	@ptext text="Loading..." layer=1 x="center" y="center" align=center size="20" color="0xffffff" name="loading…"
	@kanim name="loading" keyframe="loading" easing=linear layer=1 count=infinite time=1000


;プラグインなど
	@loadjs storage="js/jquery.ui.touch-punch.min.js"
	@plugin name="backlog" name_repeat=false
	@plugin name="tempura_autosave" log=true
	@plugin name="manpu"
	@loadcss file="./data/others/gamestyle.css"
	@call storage="novecole.ks"


;ティラノスクリプトが標準で用意している便利なライブラリ群
;コンフィグ、CG、回想モードを使う場合は必須
;@call storage="tyrano.ks"


;*セーブデータクリア※リリース後削除
;[tempura_autodelete]


;フォント設定
	[deffont face=mfrules][resetfont]


;吹き出しマクロ
	[macro name="message_left"]
		@image storage="frame_left.png" folder="image" layer=0 width=200 height=10 x=150 y=150 name="message_left,hukidasi"
		@anim name="message_left" left=100 top=25 width=660 height=135 layer="message0" time=200
		@wait time=205
		@position layer="message0" left=100 top=25 width=660 height=141 page=fore margint="0" marginl="20" marginr="10" marginb="50" frame="none"
	[endmacro]

	[macro name="message_right"]
		@image storage="frame_right.png" folder="image" layer=0 width=200 height=10 x=600 y=150 name="message_right,hukidasi"
		@anim name="message_right" left=220 top=35 width=660 height=141 layer="message0" time=200
		@wait time=205
		@position layer="message0" left=220 top=35 width=660 height=141 page=fore margint="0" marginl="20" marginr="10" marginb="50" frame="none"
	[endmacro]

;吹き出しマクロ削除
	[macro name="message_clear"]
		@free layer=0 name="hukidasi"
	[endmacro]

;セリフSE
	[macro name="asep"]
		[playse storage=Motion-Pop11-3.ogg buf=1][p]
	[endmacro]

	[macro name="ysep"]
		[playse storage=Motion-Pop11-1.ogg buf=1][p]
	[endmacro]


;初期値
	@eval exp="sf.screenfull='screenfull.png'"
	@eval exp="sf.screenfull_on='screenfull_on.png'"

;このゲームで登場するキャラクターを宣言
	;akane
	[chara_new  name="akane" storage="chara/akane/normal.png" jname="あかね" height=470]
	[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
	[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
	[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
	[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]
	;yamato
	[chara_new  name="yamato" storage="chara/yamato/normal.png" jname="やまと" height=530 ]
	[chara_face name="yamato" face="angry" storage="chara/yamato/angry.png"]
	[chara_face name="yamato" face="tohoho" storage="chara/yamato/tohoho.png"]
	[chara_face name="yamato" face="happy" storage="chara/yamato/happy.png"]
	[chara_face name="yamato" face="sad" storage="chara/yamato/sad.png"]


;プリロード
	[iscript]
		f.preload_images = [
			"data/image/space.png",
			"data/image/arrow_down.png",
			"data/image/arrow_down_on.png",
			"data/image/arrow_up.png",
			"data/image/arrow_up_on.png",
			"data/image/back_on.png",
			"data/image/back.png",
			"data/image/button_rule.png",
			"data/image/button_rule_on.png",
			"data/image/clear_stamp.png",
			"data/image/button_config_on.png",
			"data/image/button_config.png",
			"data/image/button_credit_on.png",
			"data/image/button_credit.png",
			"data/image/cursor_pointer.png",
			"data/image/cursor.png",
			"data/image/frame_1.png",
			"data/image/frame_left.png",
			"data/image/frame_right.png",
			"data/image/life_0.png",
			"data/image/life_1.png",
			"data/image/life_10.png",
			"data/image/life_11.png",
			"data/image/life_12.png",
			"data/image/life_13.png",
			"data/image/life_2.png",
			"data/image/life_3.png",
			"data/image/life_4.png",
			"data/image/life_5.png",
			"data/image/life_6.png",
			"data/image/life_7.png",
			"data/image/life_8.png",
			"data/image/life_9.png",
			"data/image/nomiss_emblem.png",
			"data/image/page_left_on.png",
			"data/image/page_left.png",
			"data/image/page_right_on.png",
			"data/image/page_right.png",
			"data/image/start_on.png",
			"data/image/start.png",
			"data/image/button_web_on.png",
			"data/image/button_web.png",
			"data/image/nextpage.png",
			"data/image/ten.png",
			"data/image/screendef.png",
			"data/image/screendef_on.png",
			"data/image/screenfull.png",
			"data/image/screenfull_on.png",
			"data/image/skip.png",
			"data/image/skip_on.png",
			"data/image/rule/mode1.png",
			"data/image/rule/mode1_no.png",
			"data/image/rule/mode1_off.png",
			"data/image/rule/mode1_on.png",
			"data/image/rule/mode2.png",
			"data/image/rule/mode2_no.png",
			"data/image/rule/mode2_off.png",
			"data/image/rule/mode2_on.png",
			"data/image/rule/mode3.png",
			"data/image/rule/mode3_no.png",
			"data/image/rule/mode3_off.png",
			"data/image/rule/mode3_on.png",
			"data/image/rule/rule.png",
			"data/image/rule/rule_off.png",
			"data/image/rule/rule_on.png",
			"data/fgimage/loading.png",
			"data/fgimage/allclear.png",
			"data/fgimage/ball.png",
			"data/fgimage/cup_shadow.png",
			"data/fgimage/cup.png",
			"data/fgimage/gameover.png", 
			"data/fgimage/hart.png",
			"data/fgimage/hit.png",
			"data/fgimage/kore.png",
			"data/fgimage/miss.png",
			"data/fgimage/mute_off.png",
			"data/fgimage/mute_on_bgm.png",
			"data/fgimage/mute_on_se.png",
			"data/fgimage/start.png",
			"data/fgimage/title_logo_01.png",
			"data/fgimage/title_logo_02.png",
			"data/fgimage/title_logo_03.png",
			"data/fgimage/screen.png",
			"data/fgimage/screen_base.png",
			"data/fgimage/chara/akane/angry.png",
			"data/fgimage/chara/akane/doki.png",
			"data/fgimage/chara/akane/happy.png",
			"data/fgimage/chara/akane/normal.png",
			"data/fgimage/chara/akane/sad.png",
			"data/fgimage/chara/yamato/angry.png",
			"data/fgimage/chara/yamato/happy.png",
			"data/fgimage/chara/yamato/normal.png",
			"data/fgimage/chara/yamato/sad.png",
			"data/fgimage/chara/yamato/tohoho.png",
			"data/bgimage/kokuban.jpg",
			"data/bgimage/room.jpg",
			"data/bgimage/stage.jpg",
			"data/bgimage/title.jpg"
		];
	[endscript]
	@preload storage=&f.preload_images wait=true


	[iscript]
		//ver管理
		sf.game_ver="ver "+$.game_ver;
		
		//プレイ時間
		TG.stat.is_counting=false;
		setInterval(function(){
			if(TG.stat.is_counting==true){
				++TG.stat.f.playtime;
				//++f.playtime;
			}
		}, 1000);
		
		localStorage.removeItem(TG.config.projectID);
	[endscript]


;なうローディング停止
	@freeimage layer=1 time=800
	@kanim name="loading" keyframe="loading" layer=1 count=0


;タブレット用
	[if exp="$.userenv() != 'pc'"]
		@ptext text="画面をタップしてください" layer=1 x="center" y="center" align=center size="28" color="0xffffff" name="tap"
		@p
		@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg" volume=0 cond="$.userenv() != 'pc'"
		@playse storage="Onmtp-Click02-1.ogg" buf=0 volume=0
		@playse storage="Onmtp-Click02-1.ogg" buf=1 volume=0
		@playse storage="Onmtp-Click02-1.ogg" buf=2 volume=0
		@playse storage="Onmtp-Click02-1.ogg" buf=3 volume=0
		@playse storage="Onmtp-Click02-1.ogg" buf=4 volume=0
		@freeimage layer=1 time=0
	[endif]

;タイトル画面へ移動
	@jump storage="title.ks"
	@s

