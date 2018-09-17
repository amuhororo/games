;NEW GAME
*tutorial
	;プレイ時間
	[iscript]
	  TG.stat.is_counting=false;
	[endscript]

	;色々クリアしたり
	@cm
	@freeimage layer=0
	@freeimage layer=1
	@clearfix
	@start_keyconfig

	;メッセージ
	@position layer="message0" left=150 top=20 width=680 height=103 page=fore visible=true frame="none" margint="0" marginl="20" marginr="20" marginb="10"


	;スッキプON時スルー
	[ignore exp="sf.tutorial_skip == true"]
		;背景
		@bg storage="room.jpg" time="600"

		;BGM
		@playbgm storage=PerituneMaterial_Positive_loop_ogg.ogg
		
		;瞬間表示
		@nowait

		;戻るボタン
		@button fix=true graphic="back.png" enterimg="back_on.png" storage=game.ks target="*gototitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

		;スキップ
		@button fix=true name="message_skip" graphic="skip.png" enterimg="skip_on.png" storage=scene1.ks target="*game_start" x=100 y=546 clickse=cancel2.ogg enterse=Accent32-1.ogg width=70
		
		;フルスクリーンボタン
		[iscript]
			TG.menu.button_screen_redraw();
		[endscript]


		;キャラ名枠あるけど非表示にする※バックログ用
		@ptext name="chara_name_area" layer="message0" color="white" size=2 x=-50 y=50
		@chara_config ptext="chara_name_area" time=0
		@anim name="chara_name_area" opacity=0 time=0

		;レイヤー表示
		@layopt layer=message0 visible=true
		@layopt layer=0 visible=true
		@layopt layer=1 visible=true
	
		;キャラ表示
		@chara_show  name="akane" layer=0 left=550 top=170 time=1000 wait=false]
		@chara_show  name="yamato" layer=0 left=60 top=110 time=1000 wait=false]

		@wait time=1000

		;会話開始
		[chara_mod cross=false  name="akane" face="happy"]
		[message_right]
			#あかね
			[manpu layer=0 name=akane type=heart3 y=100 width=80]
			遊んでくれてありがとう！[asep]
			[chara_mod cross=false  name="akane" face="default"]
			ゲームのルールを説明をしますね[asep]
			スリーシェルゲームは[chara_mod cross=false  name="yamato" face="default"][asep]
			3つのカップをシャッフルした後<br>ボールが入ってるカップを当てるゲームです[asep]
		[message_clear]

		[chara_mod cross=false  name="yamato" face="happy"  ]
		[message_left]
			#やまと
			手品でよく見るやつか～[ysep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="happy"  ]
		[message_right]
			#あかね
			手品とちがってトリックはありません[asep]
			[chara_mod cross=false  name="yamato" face="default"]
			必ず真ん中のカップから始まるからよく見てね[asep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="default"  ]
		[chara_mod cross=false  name="yamato" face="happy"  ]
		[message_left]
			#やまと
			それなら安心[ysep]
		[message_clear]
		
		[message_right]
			#あかね
			レベルは10段階あります[asep]
			ライフが無くなるとゲームオーバーです[asep]
		[message_clear]

		[chara_mod cross=false name="yamato" face="tohoho"]
		[message_left]
			#やまと
			[manpu layer=0 name=yamato type=tameiki width=80 x=0 y=-30]
			ライフあんのか…[ysep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="happy"]
		[message_right]
			#あかね
			まぁまぁ<br>最初は3個だけど[asep]
			各レベルをノーミスでクリアすると1つ増えるから[asep]
			[chara_mod cross=false  name="yamato" face="default"]
			[chara_mod cross=false  name="akane" face="default"]
			序盤でライフを増やすのがおすすめです[asep]
		[message_clear]

		[chara_mod cross=false name="yamato" face="happy"]
		[message_left]
			#やまと
			[manpu layer=0 name=yamato type=onpu width=80 x=0 y=100]
			なるほど！[ysep]
		[message_clear]

		[message_right]
			#あかね
			ゲームオーバーしても<br>コンテニューは何回でもできるよ！[asep]
		[message_clear]

		[chara_mod cross=false name="yamato" face="tohoho"]
		[message_left]
			#やまと
			[manpu layer=0 name=yamato type=hatena width=80 x=10 y=50]
			ゲームオーバーの意味とは・・・？[ysep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="default"  ]
		[message_right]
			#あかね
			[manpu layer=0 name=akane type=nanto width=80 x=20 y=35]
			あ、あと大事な事が！[asep]
		[message_clear]

		[chara_mod cross=false  name="yamato" face="default"]
		[message_left]
			#やまと
			[manpu layer=0 name=yamato type=bikkuri width=80 x=10 y=50]
			お！？[ysep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="sad"  ]
		[message_right]
			#あかね
			シャッフル中はカップが浮いちゃってるけど・・・[asep]
			[chara_mod cross=false  name="akane" face="doki"  ]
			[manpu layer=0 name=akane type=ase2 width=80 x=40 y=60]
			き、気にしちゃダメ！！！！[asep]
		[message_clear]

		[chara_mod cross=false  name="yamato" face="tohoho"]
		[message_left]
			#やまと
			[manpu layer=0 name=yamato type=mojamoja width=80 x=50 y=65]
			どうでもいいわ・・・[ysep]
		[message_clear]

		[chara_mod cross=false  name="akane" face="default"  ]
		[chara_mod cross=false  name="yamato" face="default"]
		[message_left]
			#やまと
			ちなみに<br>このルール説明が要らない場合は[ysep]
			コンフィグの「チュートリアルスキップ」を<br>ON にすると会話パートを飛ばせるぞ[ysep]
		[message_clear]


		[message_right]
			#あかね
			[chara_mod cross=false name="yamato" face="happy"]
			[chara_mod cross=false  name="akane" face="happy"  ]
			それじゃあ<br>ゲームスタートで～す！[asep]
		[message_clear]

		*game_start

		#
		@clearstack
		@clearfix name="message_skip"
		@chara_hide_all wait=500
		
		@fadeoutbgm time=500
		@wait time=550
		@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg"


	[endignore]


	[tempura_autosave slot=&sf.autosave_slot]
	@jump storage=game.ks
	@s


;エンディング
*ending
	;色々クリア
	@cm
	@freeimage layer=0
	@freeimage layer=1
	@clearfix
	@start_keyconfig

	;背景
	@bg storage="room.jpg" time="600"

	;メッセージ
	@position layer="message0" left=150 top=20 width=680 height=103 page=fore visible=true frame="none" margint="0" marginl="20" marginr="20" marginb="10"

	@nowait

	@ptext name="chara_name_area" layer="message0" color="white" size=2 x=-50 y=50
	@chara_config ptext="chara_name_area" time=0

	@layopt layer=message0 visible=true
	@layopt layer=0 visible=true
	@layopt layer=0 visible=true

	;戻るボタン
	@button fix=true graphic="back.png" enterimg="back_on.png" storage="game.ks" target="*gototitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

	;スキップ
	@button fix=true name="message_skip" graphic="skip.png" enterimg="skip_on.png" storage=scene1.ks target="*gotoending" x=100 y=546 clickse=cancel2.ogg enterse=Accent32-1.ogg width=70

	;フルスクリーンボタン
	[iscript]
		TG.menu.button_screen_redraw();
	[endscript]

	
	@chara_show  name="akane" layer=0 left=550 top=170 time=1000 wait=false
	@chara_show  name="yamato" layer=0 left=60 top=110 time=1000 wait=false

	@wait time=1000

	;会話開始
	
	[chara_mod cross=false  name="akane" face="happy"  ]
	[message_right]
	#あかね
	[manpu layer=0 name=akane type=heart3 y=100 width=80]
	クリアおめでとーーー！[asep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="happy"]
	[message_left]
		#やまと
		よくやった！！[ysep]

		;ノーミス時専用コメント
		[if exp="f.nomiss==true"]
				しかも！[ysep]
				なんと！[ysep]
				[playse storage=clear1.ogg buf=10]
				[manpu layer=0 name=yamato type=kiran width=80 x=220 y=-50]
				[font size=36]ノーミスクリア！！[resetfont][ysep]
			[message_clear]
	
			[message_right]
				#あかね
				[manpu layer=0 name=akane type=heart3 y=100 width=80]
				すごい！すごーーい！！[asep]
				正直、ノーミスでクリア出来る人が居るとは<br>思ってなかった！[asep]
			[message_clear]
	
			[message_left]
				#やまと
				ホントだよ！<br>中の人はLevel 5くらいが限界だったしな！[ysep]
			[message_clear]

			[chara_mod cross=false  name="yamato" face="default"]
			[chara_mod cross=false  name="akane" face="sad"]
			[message_right]
				#あかね
				[manpu layer=0 name=akane type=tameiki width=80 x=0 y=-30]
				デバッグで答え出してても間違ってたからね[asep]
			[message_clear]

			[chara_mod cross=false  name="yamato" face="tohoho"]
			[message_left]
				#やまと
				[manpu layer=0 name=yamato type=ase width=80 x=-150 y=50]
				それはアホなだけでは・・・[asep]
		[endif]
	[message_clear]

	[chara_mod cross=false  name="akane" face="default"]
	[chara_mod cross=false  name="yamato" face="default"]
	[message_right]
		#あかね
		ちなみに、クリアデータをロードすると<br>特別モードで遊べますよ～！[asep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="default"]
	[message_left]
		#やまと
		[manpu layer=0 name=yamato type=hatena width=80 x=10 y=50]
		え？何ソレ？[ysep]
	[message_clear]
	
	[message_right]
		#あかね
		[manpu layer=0 name=akane type=onpu width=80 x=0 y=100]
		ライフの増減なく延々と遊べる<br>「エンドレスモード」[asep]
		連続正解に挑戦する<br>「チャレンジモード」[asep]
		限界速度に挑戦する「ハイパーモード」<br>と3つのモードがあります[asep]
		それぞれ解放条件は異なりますよ！[asep]
		あ、クリアデータを削除すると<br>遊べなくなるので注意してね[asep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="tohoho"]
	[chara_mod cross=false  name="akane" face="default"]
	[message_left]
		#やまと
		[manpu layer=0 name=yamato type=ase width=80 x=-150 y=50]
		・・・微妙そうだけど、いるか？[ysep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="default"]
	[chara_mod cross=false  name="akane" face="sad"]
	[message_right]
		#あかね
		[manpu layer=0 name=akane type=ase width=80 x=-150 y=50]
		・・・・どうかな？[asep]
		[chara_mod cross=false  name="akane" face="default"]
		・・・・・・そんなことで<br>オチもなくエンディングは終わりです[asep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="happy"]
	[message_left]
		#やまと
		[manpu layer=0 name=yamato type=muka width=80 x=0 y=80]
		ひどい！[ysep]
	[message_clear]
	
	[chara_mod cross=false  name="yamato" face="default"]
	[message_right]
		#あかね
		チュートリアルやエンディングは<br>会話パートを作ってみたかっただけらしいです[asep]
	[message_clear]

	[chara_mod cross=false  name="yamato" face="sad"]
	[message_left]
		#やまと
		[manpu layer=0 name=yamato type=gaan width=80 x=0 y=80]
		本当にひどい・・・[ysep]
	[message_clear]

	[message_right]
		#あかね
		では、やっぱり作ってみたかっただけの<br>エンドロールいきまーす！[asep]
	[message_clear]
		
	[chara_mod cross=false  name="yamato" face="tohoho"]
	[message_left]
		#やまと
		[manpu layer=0 name=yamato type=ase width=80 x=-150 y=50]
		ぶっちゃけすぎ・・・[ysep]
	[message_clear]
	#

*gotoending
	@clearstack	
	@chara_hide_all wait=800
	
	@wait time=800
	
	@cm
	@eval exp="tf.ending=true"
	@layopt layer=message0 visible=false
	@freeimage layer=0
	@freeimage layer=1
	@clearfix

	@jump storage=credit.ks
	@s


;ロードデータ判別
*loadgame
	[iscript]
		f.playtime=parseInt(f.playtime);   //ロードプレイ時間代入
	  TG.stat.is_counting=false;  //プレイ時間
	[endscript]

	@cm
	@freeimage layer=0
	@freeimage layer=1
	@clearfix
	
	@nowait

	@jump storage="game.ks" cond="f.clear_flag==false"
	@jump target="*hypermode"
	@s


;ゲームモード選択
*hypermode
	@stop_keyconfig

	@layermode layer=base color=0x000000 mode=multiply opacity=190 time=0 wait=false cond="sf.tutorial_skip == true"
	
	@bg storage="room.jpg" time="600" cond="sf.tutorial_skip == true"
	@bg storage="room.jpg" time="1" cond="sf.tutorial_skip != true"

	@playbgm storage=PerituneMaterial_Positive_loop_ogg.ogg time=1000

	@position layer="message0" left=150 top=20 width=680 height=103 page=fore visible=true frame="none" margint="0" marginl="20" marginr="20" marginb="10"

	@nowait

	@layopt layer=message0 visible=true
	@layopt layer=0 visible=true
	@layopt layer=1 visible=true

	;戻る
	@button fix=true graphic="back.png" enterimg="back_on.png" storage="game.ks" target="*gototitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

	;フルスクリーンボタン
	[iscript]
		TG.menu.button_screen_redraw();
	[endscript]

	;スキップON時スルー
	[ignore exp="sf.tutorial_skip == true"]
	
		;スキップ
		@button fix=true name="message_skip" graphic="skip.png" enterimg="skip_on.png" storage="scene1.ks" target="*modeselect" x=100 y=546 clickse=cancel2.ogg enterse=Accent32-1.ogg width=70

		@start_keyconfig

		@ptext name="chara_name_area" layer="message0" color="white" size=2 x=-50 y=50
		@chara_config ptext="chara_name_area" time=0

		@chara_show  name="akane" layer=0 left=550 top=170 time=1000 wait=false
		@chara_show  name="yamato" layer=0 left=60 top=110 time=1000 wait=false
		@wait time=800

		[if exp="f.nomiss==true"]
			[chara_mod cross=false  name="akane" face="happy"]
			[message_right]
				#あかね
				[manpu layer=0 name=akane type=heart3 y=100 width=80]
				ノーミスのクリアデータですね！[asep]
				「エンドレスモード」「チャレンジモード」<br>
				「ハイパーモード」を選ぶ事ができます[asep]
				[chara_mod cross=false  name="akane" face="default"]
			[message_clear]
		[elsif exp="f.life>6"]
			[message_right]
				#あかね
				ライフを半分以上残してクリアしてますね！[asep]
				「エンドレスモード」「チャレンジモード」<br>を選ぶ事ができます[asep]
			[message_clear]
		[else]
			[message_right]
				#あかね
				クリアデータからは<br>
				「エンドレスモード」が遊べます[asep]
			[message_clear]
		[endif]

		[chara_mod cross=false  name="yamato" face="happy"]
		[message_left]
			#やまと
			各モードのルールは、タイトル画面にある<br>「ルール」ボタンで確認できるぞ！[ysep]
			[chara_mod cross=false  name="yamato" face="default"]
		[message_clear]
			
		[message_right]
			#あかね
			[chara_mod cross=false  name="yamato" face="default"]
			[chara_mod cross=false  name="akane" face="default"]
			では、モードを選んでね！[asep]
			
*modeselect

		[message_clear]

		@layermode color=0x000000 mode=multiply opacity=190 time=500 wait=false
	[endignore]

	@clearfix name="message_skip"	
	
	@position layer="message0" left=150 top=40 width=680 height=103 page=fore visible=true frame="frame_1.png" margint="0" marginl="20" marginr="20" marginb="10"

	[nolog]
	プレイモードを選んでください
	[endnolog]

	[iscript]
		$(".1_fore").css("z-index",100)
	[endscript]
	
	@ptext name="noplay,mode" layer=1 size=24 width="300" x="center" y=795 align=center text="チャレンジモード" cond="f.life<7"
	@ptext name="noplay,mode" layer=1 size=24 width="300" x="center" y=890 align=center text="ハイパーモード" cond="f.nomiss==false"

	[if exp="f.nomiss==true&&f.hyper<150"]
		;@eval exp="tf.hypertext = '速度「&nbsp;' + f.hyper + '&nbsp;」ではじめる'"

		[iscript]
			$(".layer_free").append('<div class="max_speed_text">速度「&nbsp;'+f.hyper+'&nbsp;」でプレイする</div>');
			$(".layer_free").append('<div class="max_speed"></div>');

			// YES
			function max_speed_on(){
				f.max_speed = true;
			}

			// NO
			function max_speed_off(){
				f.max_speed = false;
			}

			if(f.max_speed == true){
				$(".max_speed").toggleClass("max_speed_active");
			}

			$(".max_speed").click(function(){
				$(this).toggleClass("max_speed_active");
				$(this).hasClass("max_speed_active") ? max_speed_on() : max_speed_off();
				TG.ftag.startTag("playse",{storage:"decision3.ogg",stop:"true"});
			});

			$(".max_speed").hover(
				function () {
					TG.ftag.startTag("playse",{storage:"Accent32-1.ogg",stop:"true"});
				},
			  function () {}
			);
		[endscript]
	[endif]
	
	@glink color="glink1" name="mode" size="24" width="300" x="auto" y=700 text="エンドレスモード" target="*hyper_start" exp="tf.gamemode='endless'" clickse=decision7.ogg enterse=Accent32-1.ogg
	@glink color="glink1" name="mode" size="24" width="300" x="auto" y=795 text="チャレンジモード"  target="*hyper_start" exp="tf.gamemode='challenge'" clickse=decision7.ogg enterse=Accent32-1.ogg cond="f.life>6 || f.nomiss==true"
	@glink color="glink1" name="mode" size="24" width="300" x="auto" y=890 text="ハイパーモード"  target="*hyper_start" exp="tf.gamemode='hyper'" clickse=decision7.ogg enterse=Accent32-1.ogg cond="f.nomiss==true"

	@clearstack
	
	@wait time=1
	@anim name="mode" top="-=480" time=300
	@s


;特別モードスタート
*hyper_start

	@eval exp="tf.speed = f.hyper"
	
	@freeimage layer=0 time=500 wait=false
	@freeimage layer=1 time=500 wait=false
	@free layer="message0" name="hukidasi" time=500 wait=false 
	@fadeoutbgm time=500
	@wait time=510
	@layopt layer=message0 visible=false
	@playbgm storage="PerituneMaterial_Lets_Party_loop.ogg"
	@free_layermode time=500 wait=false
	@jump storage="game.ks"
	@s


