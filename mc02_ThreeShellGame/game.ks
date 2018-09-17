	@cm
	@freeimage layer=0
	@freeimage layer=1
	@clearfix
	@stop_keyconfig
	@nowait

	;プレイ時間
	[iscript]
	  TG.stat.is_counting=true;
	[endscript]

	@bg storage="stage.jpg" time="500"

	;戻るボタン
	@button fix=true graphic="back.png" enterimg="back_on.png" target="*gototitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

	;フルスクリーンボタン
	[iscript]
		TG.menu.button_screen_redraw();
	[endscript]

	;メッセージウィンドウの設定
	@position layer="message0" left=150 top=80 width=680 height=103 page=fore visible=true frame="frame_1.png" margint="0" marginl="20" marginr="20" marginb="10"
	@layopt layer=message0 visible=false


	;キーフレームアニメ
	[keyframe name="right1"]
		[frame p=25% x="75" y="90" ]
		[frame p=50% x="150" y="120" ]
		[frame p=70% x="225" y="90" ]
		[frame p=100% x="300"  y="0"]
	[endkeyframe]
	[keyframe name="left1"]
		[frame p=20% x="-75" y="-90" ]
		[frame p=50% x="-150" y="-120" ]
		[frame p=75% x="-225" y="-90" ]
		[frame p=100% x="-300"  y="-0"]
	[endkeyframe]
	[keyframe name="right2"]
		[frame p=25% x="150" y="90" ]
		[frame p=50% x="300" y="120" ]
		[frame p=75% x="450" y="90" ]
		[frame p=100% x="600"  y="0"]
	[endkeyframe]
	[keyframe name="left2"]
		[frame p=25% x="-150" y="-90" ]
		[frame p=50% x="-300" y="-120" ]
		[frame p=75% x="-450" y="-90" ]
		[frame p=100% x="-600"  y="0"]
	[endkeyframe]
	[keyframe name="cupup"]
		[frame p=100% y="-130"]
	[endkeyframe]
	[keyframe name="cupdown"]
		[frame p=100% y="0"]
	[endkeyframe]


	;レイヤー表示
	@layopt layer=0 visible=true
	@layopt layer=1 visible=true


	;クリア後はライフ表示飛ばす
	[ignore exp="f.clear_flag==true"]

		;life
		;色々面倒くさいので、opacityで表示非表示にする。
		@ptext text=ライフ layer=1 size=20 x=15 y=15 name="life" color=0xeeeeee time=300 face="kokuban" wait=true
		@image storage="hart.png" layer=1 x=85 y=16 name="hart1,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=110 y=16 name="hart2,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=135 y=16 name="hart3,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=160 y=16 name="hart4,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=185 y=16 name="hart5,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=210 y=16 name="hart6,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=235 y=16 name="hart7,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=260 y=16 name="hart8,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=285 y=16 name="hart9,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=310 y=16 name="hart10,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=335 y=16 name="hart11,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=360 y=16 name="hart12,hart" zindex=50 time=0
		@image storage="hart.png" layer=1 x=385 y=16 name="hart13,hart" zindex=50 time=0
		@anim name=hart opacity=0 time=0

		@stopbgm cond="f.life==0"
		@jump target=*gameover_select cond="f.life==0"

		[if exp="f.life>0"]
			@playse storage=Motion-Pop11-1.ogg buf=0
			@anim name=hart1 opacity=255 time=100
		[endif]
		[if exp="f.life>1"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg buf=1
			@anim name=hart2 opacity=255 time=100
		[endif]
		[if exp="f.life>2"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg buf=2
			@anim name=hart3 opacity=255 time=100
		[endif]
		[if exp="f.life>3"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg buf=3
			@anim name=hart4 opacity=255 time=100
		[endif]
		[if exp="f.life>4"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg buf=4
			@anim name=hart5 opacity=255 time=100
		[endif]
		[if exp="f.life>5"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart6 opacity=255 time=100 buf=0
		[endif]
		[if exp="f.life>6"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart7 opacity=255 time=100 buf=1
		[endif]
		[if exp="f.life>7"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart8 opacity=255 time=100 buf=2
		[endif]
		[if exp="f.life>8"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart9 opacity=255 time=100 buf=3
		[endif]
		[if exp="f.life>9"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart10 opacity=255 time=100 buf=4
		[endif]
		[if exp="f.life>10"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart11 opacity=255 time=100 buf=0
		[endif]
		[if exp="f.life>11"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart12 opacity=255 time=100 buf=1
		[endif]
		[if exp="f.life>12"]
			@wait time=100
			@playse storage=Motion-Pop11-1.ogg
			@anim name=hart13 opacity=255 time=100 buf=2
		[endif]

	[endignore]


/*ゲームスタート*/
*playstart

	;ミスフラグリセット
	[if exp="tf.levelup==false"]
		@eval exp="tf.miss=true"
	[else]
		@eval exp="tf.miss=false"
	[endif]

	;表示リセット
	;@cm
	;@freeimage layer=0
	;@layopt layer=message0 visible=false

	;初期値
	@eval exp="tf.loadgame=false"
	@eval exp="tf.count=0"
	@eval exp="tf.cup=1"
	@eval exp="tf.cup0=['0','0','1']"
	@eval exp="tf.cup1=['1','2','2']"

	;Level調整
	[if exp="f.level==1"]
		@eval exp="tf.speed=500"
		@eval exp="tf.count_max=5"
	[elsif exp="f.level==2"]
		@eval exp="tf.speed=380"
		@eval exp="tf.count_max=6"
	[elsif exp="f.level==3"]
		@eval exp="tf.speed=320"
		@eval exp="tf.count_max=8"
	[elsif exp="f.level==4"]
		@eval exp="tf.speed=270"
		@eval exp="tf.count_max=10"
	[elsif exp="f.level==5"]
		@eval exp="tf.speed=230"
		@eval exp="tf.count_max=12"
	[elsif exp="f.level==6"]
		@eval exp="tf.speed=200"
		@eval exp="tf.count_max=14"
	[elsif exp="f.level==7"]
		@eval exp="tf.speed=180"
		@eval exp="tf.count_max=16"
	[elsif exp="f.level==8"]
		@eval exp="tf.speed=165"
		@eval exp="tf.count_max=18"
	[elsif exp="f.level==9"]
		@eval exp="tf.speed=155"
		@eval exp="tf.count_max=20"
	[elsif exp="f.max_speed == true"]
		@eval exp="tf.speed=f.hyper"
		@eval exp="tf.count_max=20"	
	[elsif exp="tf.gamemode=='hyper' && tf.speed<=50"]
		@eval exp="tf.speed=50"
		@eval exp="tf.count_max=tf.count_max+2"
	[elsif exp="tf.gamemode=='hyper' && tf.levelup==true"]
		@eval exp="tf.speed=tf.speed-2"
	[elsif exp="tf.gamemode=='hyper' && tf.clear_repeat==false"]
		@eval exp="tf.speed=150"
		@eval exp="tf.count_max=20"	
	[elsif exp="tf.levelup==false"]
		;そのまま
	[else]
		@eval exp="tf.speed=150"
		@eval exp="tf.count_max=20"	
	[endif]


	;Level表示
	[if exp="tf.gamemode=='endless'"]
		@eval exp="tf.level='エンドレスモード'"
		@eval exp="tf.level_y=15"
		@eval exp="tf.speedlevel='スピード&nbsp;'+tf.speed"
	[elsif exp="tf.gamemode=='challenge'"]
		@eval exp="tf.level='チャレンジモード'"
		@eval exp="tf.level_y=15"
		@eval exp="tf.speedlevel='<span>あたり&nbsp;'+tf.endless_count+'&nbsp;かい<br></span>スピード&nbsp;'+tf.speed"
	[elsif exp="tf.gamemode=='hyper'"]
		@eval exp="tf.level='ハイパーモード'"
		@eval exp="tf.level_y=15"
		@eval exp="tf.speedlevel='スピード&nbsp;'+tf.speed"
	[else]
		@eval exp="tf.level='レベル&nbsp;'+f.level"
		@eval exp="tf.level_y=42"
	[endif]


	;表示リセット
	@cm
	@freeimage layer=0 time=0
	@layopt layer=message0 visible=false

	;もう一回の時はレベル表示飛ばす
	@jump target="*levelskip" cond="tf.clear_repeat==true"

	;レベル表示
	@playse storage=Shortbridge17-1.ogg buf=0
	@ptext text=&tf.level layer=0 size=80 x=0 y=150 width=960 align=center name=level,leveltext time=0 face="kokuban" color="0xeeeeee"

	@ptext text=&tf.speedlevel layer=0 size=40 x=center y=240 name=speed,leveltext time=0 face="kokuban" color="0xeeeeee" cond="f.clear_flag==true"

	@anim layer=0 name=leveltext opacity=0 time=0
	@anim layer=0 name=leveltext opacity=255 time=400
	@wait time=600
	@free layer=0 name=leveltext time=400
	@wait time=150


*levelskip
	@ptext text=&tf.level layer=0 size=20 x=15 y=&tf.level_y name=level,leveltextmini color=0xeeeeee time=0 face="kokuban" time=0
	;[if exp="f.clear_flag==true && tf.clear_repeat==false"]
	;	@ptext text=&tf.level layer=0 size=20 x=15 y=&tf.level_y name=level,leveltextmini color=0xeeeeee time=0 face="kokuban" time=0
	;[else]
	;	@ptext text=&tf.level layer=0 size=20 x=15 y=&tf.level_y name=level,leveltextmini color=0xeeeeee time=0 face="kokuban" time=0
	;[endif]

	@ptext text=&tf.speedlevel layer=0 size=20 x=15 y=45 name=speed,leveltextmini color=0xeeeeee face="kokuban" time=0 cond="f.clear_flag==true"


	[if exp="tf.clear_repeat==false"]
		@anim name=leveltextmini opacity=0 time=0
		@anim name=leveltextmini opacity=255 time=400
	[elsif exp="tf.gamemode!='endless'"]
		@anim name=speed opacity=0 time=0
		@anim name=speed opacity=255 time=0
	[endif]

	@free layer=0 name="leveltext" time=0


	;カップ登場
	@image storage="cup.png" layer=0 x=90 y=-100 name="cup0,cup,cupclear" zindex=22 time=0
	@image storage="cup.png" layer=0 x=390 y=-100 name="cup1,cup,cupclear" zindex=21 time=0
	@image storage="cup.png" layer=0 x=690 y=-100 name="cup2,cup,cupclear" zindex=20 time=0

	;影
	@image storage="cup_shadow.png" layer=0 x=90 y=487 name="cup0,cupshadow,cupclear" zindex=12 time=0
	@image storage="cup_shadow.png" layer=0 x=390 y=487 name="cup1,cupshadow,cupclear" zindex=11 time=0
	@image storage="cup_shadow.png" layer=0 x=690 y=487 name="cup2,cupshadow,cupclear" zindex=10 time=0

	@anim name=cupshadow opacity=0 time=0
	@anim name=cup top=310 time=400
	@anim name=cupshadow opacity=255 time=500
	@wait time=400
	@playse storage=caffee-saucer-place1.ogg buf=1
	@playse storage=caffee-saucer-place1.ogg buf=2
	;ボール表示
	@image storage="ball.png" layer=0 x=430 y=410 name="ball" zindex=18
	@layopt layer=message0 visible=true

	[nolog]
	準備はいい？
	[endnolog]

	;スタートボタン
	@glink color="glink1" size="26" width="260" left="auto" y="220" text="おっけー"  target="*shuffle" clickse=decision5.ogg enterse=Accent32-1.ogg
	@s


/*シャッフル開始*/
*shuffle
	@layopt layer=message0 visible=false
	@image storage=start.png layer=0 width=372 height=78 left=center top=180 name=start time=500 zindex=30

	;とりあえず真ん中から開始
	@kanim keyframe=cupup name=cup layer=0 time=800
	@wait time=400
	@free layer=0 name=start time=500
	@wait time=200
	@kanim keyframe=cupdown name=cup layer=0 time=500
	@wait time=400
	@playse storage=caffee-saucer-place1.ogg buf=1
	@playse storage=caffee-saucer-place1.ogg buf=2
	@free layer=0 name="ball" time=0
	@wait time=100


/*シャッフルループ*/
*loop
;[if exp="tf.count_max>tf.count"]
	@eval exp="tf.bufnum=+(tf.count+'').slice(-1)"
	@eval exp="tf.bufnum=tf.bufnum-5" cond="tf.bufnum>4"
	@playse storage=Motion-Pop41-1.ogg clear=true buf=&tf.bufnum
	@eval exp="tf.rand = Math.floor( Math.random() * 3)"
	@eval exp="tf.count=tf.count+1"
	@eval exp="tf.idou=tf.cup1[tf.rand]-tf.cup0[tf.rand]"
	@eval exp="tf.kanim0='right'+tf.idou"
	@eval exp="tf.kanim1='left'+tf.idou"
	@eval exp="tf.cupname0='cup'+tf.cup0[tf.rand]"
	@eval exp="tf.cupname1='cup'+tf.cup1[tf.rand]"
	@kanim keyframe=&tf.kanim0 name=&tf.cupname0 layer=0 easing=linear time=&tf.speed
	@kanim keyframe=&tf.kanim1 name=&tf.cupname1 layer=0 easing=linear time=&tf.speed
	@wait time=&tf.speed
	@wait time=50
	@wait time=100 cond="tf.count_max==tf.count"

	;カップ位置把握が面倒くさいので配置リセット…
	@free layer=0 name=cupclear time=0
	@image storage="cup.png" layer=0 x=90 y=310 name="cup0,cup,cupclear" zindex=22 time=0 wait=false
	@image storage="cup.png" layer=0 x=390 y=310 name="cup1,cup,cupclear" zindex=21 time=0 wait=false
	@image storage="cup.png" layer=0 x=690 y=310 name="cup2,cup,cupclear" zindex=20 time=0 wait=false

	;影
	@image storage="cup_shadow.png" layer=0 x=90 y=487 name="cup0,cupshadow,cupclear" zindex=12 time=0 wait=false
	@image storage="cup_shadow.png" layer=0 x=390 y=487 name="cup1,cupshadow,cupclear" zindex=11 time=0 wait=false
	@image storage="cup_shadow.png" layer=0 x=690 y=487 name="cup2,cupshadow,cupclear" zindex=10 time=0
;[endif]


/*ボールが入ったカップ移動*/
*cup_check
	@clearstack stack=if
	[if exp="tf.cup==tf.cup0[tf.rand]"]
		@eval exp="tf.cup=tf.cup1[tf.rand]"
	[elsif exp="tf.cup==tf.cup1[tf.rand]"]
		@eval exp="tf.cup=tf.cup0[tf.rand]"
	[endif]
	@jump target=*loop cond="tf.count_max>tf.count"
	@jump target=*cup_select cond="tf.count_max==tf.count"
	@s


/*カップ選択*/
*cup_select
	@cm
	@layopt layer=message0 visible=true

	[nolog]
		どのカップに入ってる？<br>[font size=17]（カップをクリックしてください）[resetfont]
		;答え！
		;@emb exp="tf.cup"
	[endnolog]

	@glink color="cup_select" width=180 height=210 x=90 y=310 target="*hit" cond="tf.cup==0" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup1'" text="　"
	@glink color="cup_select" width=180 height=210 x=390 y=310 target="*hit" cond="tf.cup==1" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup2'" text="　"
	@glink color="cup_select" width=180 height=210 x=690 y=310 target="*hit" cond="tf.cup==2" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup3'" text="　"

	@glink color="cup_select" width=180 height=210 x=90 y=310 target="*miss" cond="tf.cup!=0" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup1'" text="　"
	@glink color="cup_select" width=180 height=210 x=390 y=310 target="*miss" cond="tf.cup!=1" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup2'" text="　"
	@glink color="cup_select" width=180 height=210 x=690 y=310 target="*miss" cond="tf.cup!=2" clickse=decision9.ogg enterse=Accent32-1.ogg exp="tf.select='cup3'" text="　"
	@s


;当たり
*hit
	@image storage="kore.png" layer=0 x=128 y=200 time=0 name="kore,close" cond="tf.select=='cup1'" zindex=50
	@image storage="kore.png" layer=0 x=428 y=200 time=0 name="kore,close" cond="tf.select=='cup2'" zindex=50
	@image storage="kore.png" layer=0 x=728 y=200 time=0 name="kore,close" cond="tf.select=='cup3'" zindex=50
	@layopt layer=message0 visible=false

	@eval exp="f.level=f.level+1" cond="f.clear_flag==false"

	@wait time=500
	@image storage="hit.png" layer=0 x=310 y=100 time=0 name="hit,close" zindex=50
	@anim name="hit" opacity=0 time=0
	@anim name="hit" top=10 opacity=255 time=500
	@anim name="kore" top=240 time=500
	@playse storage="Quiz-Correct_Answer01-1.ogg" buf=1

	;レベルアップ判定
	@eval exp="tf.levelup=true"
	@eval exp="tf.levelup=false" cond="tf.gamemode=='endless'"
	@eval exp="tf.endless_count=tf.endless_count+1" cond="tf.gamemode=='challenge'"

	@jump target=*que
	@s


;はずれ
*miss
	@image storage="kore.png" layer=0 x=128 y=200 time=0 name="kore,close" cond="tf.select=='cup1'" zindex=50
	@image storage="kore.png" layer=0 x=428 y=200 time=0 name="kore,close" cond="tf.select=='cup2'" zindex=50
	@image storage="kore.png" layer=0 x=728 y=200 time=0 name="kore,close" cond="tf.select=='cup3'" zindex=50
	
	@layopt layer=message0 visible=false
	@wait time=500

	@image storage="miss.png" layer=0 x=310 y=-70 name="miss,close" zindex=50
	@anim name="miss" opacity=0 time=0]
	@anim name="miss" top=10 opacity=255 time=500]
	@anim name="kore" top=240 time=500]
	@playse storage="Quiz-Wrong_Buzzer01-1.ogg" buf=1

	@eval exp="tf.levelup=false"
	[if exp="f.clear_flag==false"]
		@eval exp="tf.miss=true"
		@eval exp="f.nomiss=false"
	[endif]

	@jump target=*que
	@s


;結果
*que
	;プレイカウント
	@eval exp="f.play_count=f.play_count+1"

	;ボール表示
	@image storage="ball.png" layer=0 x=130 y=410 name="ball,cupclear" visible=true zindex=18 time=0 cond="tf.cup==0"
	@image storage="ball.png" layer=0 x=430 y=410 name="ball,cupclear" visible=true zindex=18 time=0 cond="tf.cup==1"
	@image storage="ball.png" layer=0 x=730 y=410 name="ball,cupclear" visible=true zindex=18 time=0 cond="tf.cup==2"
	;カップを開ける
	@kanim keyframe=cupup name=cup layer=0 time=500
	@wait time=500


	@jump target=*clear cond="f.level==11"
	@jump target=*gameover cond="tf.gamemode=='challenge' && tf.levelup==false"
	@jump target=*restart cond="tf.gamemode=='challenge' && tf.levelup==true""
	@jump target=*next cond="tf.gamemode=='challenge' && tf.levelup==true || f.clear_flag==true"
	@jump target=*life_disp
	@s


*life_disp
	;ライフ増減
	
	[keyframe name="lifeup"]
		[frame p=0% scale="0" opacity=0]
		[frame p=20% scale="0.5" opacity=1]
		[frame p=70% scale="1.5" opacity=1]
		[frame p=100% scale="1" opacity=1]
	[endkeyframe]

	[keyframe name="lifedown"]
		[frame p=0% x="2" scale="1" opacity=1]
		[frame p=10% x="-2" scale="1" opacity=1]
		[frame p=20% x="2" scale="1" opacity=1]
		[frame p=30% x="-2" scale="1" opacity=1]
		[frame p=40% x="2" scale="1" opacity=1]
		[frame p=50% x="-2" scale="1" opacity=1]
		[frame p=60% x="2" scale="1" opacity=1]
		[frame p=70% x="-2" scale="0.25" opacity=0.25]
		[frame p=80% x="2" scale="0.5" opacity=0.5]
		[frame p=90% x="-2" scale="0.75" opacity=0.75]
		[frame p=100% x="2" scale="0" opacity=0]
	[endkeyframe]

	[if exp="tf.levelup==false"]
		@eval exp="tf.hart='hart'+f.life"
		@playse storage=Motion-Swallow01-1.ogg clear=true
		@kanim keyframe="lifedown" name=&tf.hart time=400
		@eval exp="f.life=f.life-1"
	[elsif exp="tf.miss==false"]
		@eval exp="f.life=f.life+1"
		@eval exp="tf.hart='hart'+f.life"
		@playse storage=Motion-Pop11-1.ogg clear=true
		@kanim keyframe="lifeup" name=&tf.hart time=400
	[endif]
	@wait time=500

	@jump target=*gameover cond="f.life==0"
	@jump target=*next
	@s


/*次へ*/
*next
	[if exp="f.clear_flag==false && tf.levelup==true"]
		@eval exp="tf.nextlevel='レベル&nbsp;'+f.level+'&nbsp;へ'"
	[elsif exp="tf.gamemode=='hyper' && tf.speed==50"]
		@eval exp="tf.nextlevel='もっと回せ！'"
		@eval exp="tf.clear_repeat=false" cond="f.clear_flag==true"
	[elsif exp="tf.gamemode=='hyper' && tf.levelup==true"]
		@eval exp="tf.nextlevel='もっと早く！'"
		@eval exp="tf.clear_repeat=false" cond="f.clear_flag==true"
	[else]
		@eval exp="tf.nextlevel='もう一回'"
		@eval exp="tf.clear_repeat=true" cond="f.clear_flag==true"
	[endif]


	@glink color="glink1" size="26" width="260" x="auto" y="310" text=&tf.nextlevel target="*restart" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg


	@eval exp="f.hyper=tf.speed" cond="f.hyper>tf.speed"

	@clearstack stack=if
	[tempura_autosave slot=&sf.autosave_slot]
	@s



/*もっかい遊ぶ*/
*restart
	@eval exp="tf.clear_repeat=true" cond="tf.gamemode=='challenge'"
	@free layer=0 name=close time=400 wait=false
	@free layer=0 name=cupclear time=400
	@wait time=200
	@jump target=*playstart
	@s



/*タイトルへ戻る*/
*gototitle
	[tempura_autosave slot=&sf.autosave_slot]
	@cm
	@clearstack
	@layopt layer=message0 visible=false
	@freeimage layer=0
	@freeimage layer=1
	@clearfix
	@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg"
	@jump storage=title.ks
	@s


;ゲームオーバー
*gameover
	@fadeoutbgm time=600 cond="tf.gamemode!='challenge'"
	@playse storage=gameover.ogg cond="tf.gamemode!='challenge'"
	@free name=close layer=0 time=1000


;あきらめるか
*gameover_select
	[if exp="tf.loadgame==true"]
		@fadeinbgm storage=kokyou-no-yuuhi-mbox.ogg time=1000
	[endif]
	
	@image storage=gameover.png name=gameover layer=0 width=535 height=83 left=center top=180 time=1000 zindex=100 cond="tf.gamemode!='challenge'"

	[if exp="tf.loadgame==false && tf.gamemode!='challenge'"]
		@wait time=2000
		@fadeinbgm storage=kokyou-no-yuuhi-mbox.ogg time=5000
	[endif]
	
	@free name=gameover layer=0 time=1000 cond="tf.gamemode!='challenge'"
	@layopt layer=message0 visible=true
	
	[if exp="tf.gamemode=='challenge'"]
		@eval exp="f.challenge=tf.endless_count" cond="f.challenge<tf.endless_count"
		[nolog]
			連続正解は [emb exp="tf.endless_count"] 回です
		[endnolog]
		@glink color="glink1" size="26" width="260" x="auto" y="280" text="もう一回！"  target="*continue" clickse=decision7.ogg enterse=Accent32-1.ogg
	[else]
		[nolog]
			あきらめますか？
		[endnolog]
		@glink color="glink1" size="22" width="220" x="200" y="280" text="あきらめない"  target="*continue" clickse=decision7.ogg enterse=Accent32-1.ogg
		@glink color="glink1" size="22" width="220" x="540" y="280" text="あきらめる" target="*gototitle" clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	[endif]
	
	[if exp="tf.loadgame==false"]
		[tempura_autosave slot=&sf.autosave_slot]
	[endif]
	@s


;コンテニュー
*continue
	[if exp="tf.gamemode=='challenge'"]
		@eval exp="tf.endless_count=0"
		@eval exp="tf.clear_repeat=false"
	[elsif exp="f.clear_flag==false"]
		@eval exp="f.life=3"
		@eval exp="tf.levelup=true"
		@wait time=500
		@layopt layer=message0 visible=false
		@playse storage=Motion-Pop11-1.ogg clear=true buf=0
		@anim name=hart1 opacity=255 time=500
		@wait time=100
		@playse storage=Motion-Pop11-1.ogg clear=true buf=1
		@anim name=hart2 opacity=255 time=500
		@wait time=100
		@playse storage=Motion-Pop11-1.ogg clear=true buf=2
		@anim name=hart3 opacity=255 time=500
	[endif]
	
	@eval exp="tf.loadgame=false"
	@wait time=800
	@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg" cond="tf.gamemode!='challenge'"
	[tempura_autosave slot=&sf.autosave_slot]
	@jump target=*playstart
	@s


/*クリア*/
*clear

	@wait time=300

	@fadeoutbgm time=600
	@playse storage=clear1.ogg buf=0
	
	@eval exp="f.level=10"
	@eval exp="f.clear_flag=true"
	
	[if exp="f.nomiss==true"]
		@eval exp="sf.mode_flag=3"
		@eval exp="f.hyper=150"
		@eval exp="f.challenge=0"
	[elsif exp="f.life>6"]
		@eval exp="sf.mode_flag=2" cond="sf.mode_flag<2"
		@eval exp="f.challenge=0"
	[else]
		@eval exp="sf.mode_flag=1" cond="sf.mode_flag<1"
	[endif]
	
	@image storage=allclear.png layer=0 left=center top=180 width=493 height=84 name=allclear zindex=100 time=1300
	@anim name=close layer=0 opacity=0 time=800
	@anim name=cupclear layer=0 opacity=0 time=800

	@wait time=1500

	@fadeinbgm storage=PerituneMaterial_Positive5_loop.ogg time=1000

	@wait time=500

	[tempura_autosave slot=&sf.autosave_slot]
	
	
	ノベコレバッジ
	[if exp="f.nomiss==true"]
		[give_emblem id="5035" pid="ed68d2fc6b4dc57b61863efacaa19754" ]
	[elsif exp="f.life>6"]
		[give_emblem id="5036" pid="ac7570f0a635f928871fcb5ad356d02c" ]
	[else]
		[give_emblem id="5033" pid="468cf7fed08688bcf67e8d095ac0a22b" ]
	[endif]
	
	
	@free name=allclear layer=0 time=1000
	@jump storage="scene1.ks" target=*ending
	@s
