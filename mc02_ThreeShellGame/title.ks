*start
	@stop_keyconfig
	@free_layermode
	@freeimage layer=1 time=0
	@cm
	@clearfix

	[iscript]
		;プレイ時間
	  TG.stat.is_counting=false;

	  ;変数初期化
	  f={}
	  tf={}
		tf.ending=false
	[endscript]


	@bg storage="title.jpg" time=100
	@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg"

	;ロゴ
	@image storage="title_logo_01.png" name="title_logo,logo01" layer=1 x=0 y=-10 time=500 wait=false
	@playse storage=Accent32-1.ogg buf=0
	@wait time=150
	@playse storage=Accent32-1.ogg buf=1
	@image storage="title_logo_02.png" name="title_logo,logo02" layer=1 x=189 y=74 time=500 wait=false
	@wait time=200
	@playse storage=Accent32-1.ogg buf=2
	@image storage="title_logo_03.png" name="title_logo,logo03" layer=1 x=92 y=184 time=500 wait=false


	;カップアニメ
	[keyframe name="cup_anim"]
		@frame p=0% y="0" rotate="0deg" opacity=1
		@frame p=20% y="0" rotate="0deg" opacity=1
		@frame p=100% y="-110" rotate="45deg" opacity=1
	[endkeyframe]
	[keyframe name="cup_anim_stop"]
		@frame p=0% y="-110" rotate="45deg" opacity=1
	[endkeyframe]

	;カップ影
	@image storage="cup_shadow.png" layer=1 x=650 y=525 name="cupshadow" zindex=1 time=0 width=120
	@image storage="cup_shadow.png" layer=1 x=200 y=525 name="cupshadow" zindex=1 time=0 width=120
	@image storage="cup_shadow.png" layer=1 x=420 y=525 name="cupshadow" zindex=1 time=0 width=120
	@anim name=cupshadow opacity=0 time=0

	;カップ振ってくる
	@anim name=cupshadow opacity=255 time=400
	@image storage="cup.png" layer=1 x=420 y=-150 name="cup0,cup" zindex=3 time=0 width=120
	@anim name=cup0 top=407 opacity=255 time=400
	@wait time=90
	@image storage="cup.png" layer=1 x=650 y=-150 name="cup1,cup" zindex=3 time=0 width=120
	@anim name=cup1 top=407 opacity=255 time=400
	@wait time=40
	@image storage="cup.png" layer=1 x=200 y=-150 name="cup2,cup" zindex=3 time=0 width=120
	@anim name=cup2 top=407 opacity=255 time=400
	@wait time=265
	@playse storage=caffee-saucer-place1.ogg buf=3
	@wait time=90
	@playse storage=caffee-saucer-place1.ogg buf=4
	@wait time=40
	@playse storage=caffee-saucer-place1.ogg buf=5

	;カップ開ける
	;@wait time=1
	@image storage="ball.png" layer=1 x=445 y=470 name="ball" zindex=2 time=0 width=70
	@kanim name="cup0" keyframe="cup_anim" layer=1 count=1 time=600

	@wait time=100

	;ver表記
	@ptext layer=1 name="copy,open" x=420 y=235 size=18 text=&sf.game_ver color="0xeeeeee" face="kokuban" time=0 wait=false


	;ボタン
	@button x=855 y=15 graphic="button_config.png" enterimg="button_config_on.png" name="config,open,button"  storage="config.ks" role="sleepgame" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg width=80
	@button x=750 y=15 graphic="button_rule.png" enterimg="button_rule_on.png" name="credit,open,button" storage="rule.ks" role="sleepgame" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg width=80
	@button x=645 y=15 graphic="button_credit.png" enterimg="button_credit_on.png" name="credit,open,button" storage="credit.ks" role="sleepgame" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg width=80
	@button x=540 y=15 graphic="button_web.png" enterimg="button_web_on.png" name="web,open,button" target="*web" role="sleepgame" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg width=80

	;フルスクリーン
	[iscript]
		TG.menu.button_screen_redraw();
	[endscript]
	;@button fix=true name="fullscreen" role="fullscreen" graphic=&f.screenfull enterimg=&f.screenfull_on x=15 y=538 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

	;ボタン、ver表記opacity
	[anim name=open opacity=0 time=0]
	[anim name=open opacity=255 time=500]


	;スタートボタン
	[keyframe name="blink"]
		[frame p=0% opacity="1"]
		[frame p=25% opacity="1"]
		[frame p=100% opacity="0.3"]
	[endkeyframe]
	[keyframe name="blink_stop"]
		[frame p=100% opacity="1"]
	[endkeyframe]
	[button x=550 y=190 graphic="start.png" enterimg="start_on.png" name="game_start,button" role="sleepgame" storage="../others/plugin/tempura_autosave/load.ks" clickse=decision7.ogg enterse=Accent32-1.ogg]
	[anim name=game_start opacity=0 time=0]
	[anim name=game_start opacity=255 time=500]
	[wait time=500]
	[kanim name="cup0" keyframe="cup_anim_stop" count=0 time=0]
	[kanim name="game_start" keyframe="blink" direction=alternate count=infinite time=2000]

	;hover処理…他にやり方わからず。make.ksにも必要。
	[iscript]
		$(".game_start").hover(
			function(){
				TG.kag.ftag.startTag("kanim",{name:"game_start",keyframe:"blink_stop",count:"1",time:"1000"})
			},
			function(){
				TG.kag.ftag.startTag("kanim",{name:"game_start",keyframe:"blink",count:"infinite",direction:"alternate",time:"2000"})
			}
		);
	[endscript]

	;TGFエンブレム
	@image storage="tgf_emb.png" folder=image x=20 y=300 width=140 layer=1 zindex=10 name=shadow


	;バッジ取得ボタン
	@ptext name=badge,badge_area x=&380+450 y=540 layer=1 text=""
	@image name=badge,glay storage="badge1.png" folder=image x=&510+450 y=550 width=130 layer=1 cond="sf.mode_flag<1 || sf.mode_flag==undefined"
	@image name=badge,glay storage="badge2.png" folder=image x=&660+450 y=550 width=130 layer=1 cond="sf.mode_flag<2 || sf.mode_flag==undefined"
	@image name=badge,glay storage="badge3.png" folder=image x=&810+450 y=550 width=130 layer=1 cond="sf.mode_flag<3 || sf.mode_flag==undefined"
	@button name=button,badge graphic="badge1.png" target="badge1" x=&510+450 y=550 width=130 fix=true clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=1"
	@button name=button,badge graphic="badge2.png" target="badge2" x=&660+450 y=550 width=130 fix=true clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=2"
	@button name=button,badge graphic="badge3.png" target="badge3" x=&810+450 y=550 width=130 fix=true clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=3"
	@glink name=badge,badge_btn,open x=&380+450 y=540 text=クリアバッジ size=16 color=0xffffff width=130 target=badge_on
	@s

	*badge_on
	;バッジ取得ボタンオープン
	@glink name=badge,badge_btn,close x=&380+450 y=540 text=クリアバッジ size=16 color=0xffffff width=130 target=badge_close
	@anim name=badge layer=1 left="-=450" time=250
	@s

	*badge_close
	@glink name=badge,badge_btn,open x=380 y=540 text=クリアバッジ size=16 color=0xffffff width=130 target=badge_on
	@anim name=badge layer=1 left="+=450" time=250
	@s


	;ニューゲーム
	*newgame
	@eval exp="f.playtime=0"
	@eval exp="f.level=1"
	@eval exp="f.life=3"
	@eval exp="f.play_count=0"
	@eval exp="f.nomiss=true"
	@eval exp="f.clear_flag=false"
	@eval exp="f.playtime=0"
	@eval exp="f.hyper=''"
	@eval exp="tf.clear_repeat=false"
	@eval exp="tf.gamemode='normal'"
	@eval exp="tf.loadgame=false"
	@jump storage="scene1.ks"
	[s]

	;ロード
	*loadgame
	@eval exp="tf.gamemode='normal'"
	@eval exp="tf.loadgame=true"
	@eval exp="tf.clear_repeat=false"
	@eval exp="tf.endless_count=0"
	@eval exp="tf.levelup==false"
	@jump storage="scene1.ks" target=*loadgame
	[s]


	*web
	[web url="http://hororo.wp.xdomain.jp/185/"]
	[awakegame]
	[s]


	*badge1
	[give_emblem id="5033" pid="468cf7fed08688bcf67e8d095ac0a22b" ]
	[return]

	*badge2
	[give_emblem id="5036" pid="ac7570f0a635f928871fcb5ad356d02c" ]
	[return]

	*badge3
	[give_emblem id="5035" pid="ed68d2fc6b4dc57b61863efacaa19754" ]
	[return]
