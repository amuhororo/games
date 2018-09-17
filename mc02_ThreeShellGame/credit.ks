;諸々クリア
	@cm
	@layopt layer=message0 visible=false
	@freeimage layer=0
	@freeimage layer=1
	@clearfix name="button"
	@stop_keyconfig

	@layopt layer=0 visible=true


	;エンドロール
	[if exp="tf.ending==true"]

		@mask time=1000
		[iscript]
			;背景引っぺがし方がわからず！！
			$(".base_fore").css("background-image","none")
		[endscript]
		
		;スキップボタン
		@glink color=skip text="スキップ" size=16 name=skip x=860 y=600 target="*thx" clickse=decision3.ogg

		[html top=350 left=0 name="creditscroll"]


	;通常クレジット
	[else]

		@bg storage ="kokuban.jpg" time=100

		;戻る
		@button fix=true graphic="back.png" enterimg="back_on.png" target="*backtitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

		@wait time=100
		@image storage ="screen.png" name=screen time=0 y=-580 x=0 layer=0
		@image storage ="screen_base.png" time=0 y=0 x=0 layer=0

		@anim name=screen layer=0 top=0 time=250
		@wait time=255
		
		@ptext layer=0 x=170 y=40 bold="true" size=36 color="0x444444" name="rabel_credit" text="クレジット"
		@ptext layer=0 x=360 y=62 bold="true" color="0x444444" size=16 name="rabel_credit" text="※敬称略・順不同"
		
		
		*page1
			;@clearfix name="button"
			@cm
			
			;ページ送り
			@button graphic="page_right.png" enterimg="page_right_on.png" target="*page2" x=855 y=270 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg name="button"
	
			[html top=100 left=150 name="credit_area,credittext"]

	[endif]


	;本文1
	<dl>
	<dt>画像素材</dt>
		<dd>ティラノスクリプト用 キャラクター素材</dd>
		<dd>きまぐれアフター</dd>
		<dd>イラストＡＣ</dd>
		<dd>ICOOON MONO</dd>
	<dt>フォント</dt>
		<dd>M+</dd>
		<dd>ラノベポップ</dd>
		<dd>チョークでかいたようなフォント</dd>
	</dl>


	;通常クレジット
	[if exp="tf.ending!=true"]

		[endhtml]
		@s
		
		
		*page2
		@cm
		
		;ページ送り
		@button graphic="page_left.png" enterimg="page_left_on.png" target="*page1" x=45 y=270 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg name="button"
		@button graphic="page_right.png" enterimg="page_right_on.png" target="*page3" x=855 y=270 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg name="button"
		
		[html top=100 left=150 name="credit_area"]

	[endif]


	;本文2
	<dl>
	<dt>音楽・効果音</dt>
		<dd>PeriTune</dd>
		<dd>Music is VFR</dd>
		<dd>効果音ラボ</dd>
		<dd>TAM Music Factory</dd>
		<dd>ポケットサウンド</dd>
	</dl>


	[if exp="tf.ending!=true"]

		[endhtml]
		@s


		*page3
		@cm
	
		;ページ送り
		@button graphic="page_left.png" enterimg="page_left_on.png" target="*page2" x=45 y=270 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg name="button"
	
		[html top=100 left=150 name="credit_area"]

	[endif]


	;本文3
	<dl>

	<dt>使用プラグイン</dt>
		<dd>STUDIO OVERDRIVE</dd>
		<dd>てんぷらたべたい</dd>
		<dd>空想曲線</dd>
		<dd>jQuery UI Touch Punch</dd>

	<dt>制作ツール</dt>
		<dd>ティラノスクリプト</dd>


	<dt>制作</dt>
		<dd>めも調　hororo</dd>
	</dl>


	[endhtml]


	[if exp="tf.ending==true"]

		@wait time=1

		[keyframe name="scroll"]
			@frame p=100% y="-3280"
		[endkeyframe]
		@kanim name="creditscroll" keyframe="scroll" time="40000" easing="linear"

		@mask_off time=1500

		@wait time=41000

		@anim name=creditscroll opacity=0 time=1500
		@wait time=1500
		
		*thx
		@ptext name=thx size=30 top=center left=center layer=0 color="0xffffff" align="center" text="遊んで頂き<br>ありがとうございました！" time=2000
		
		@wait time=1500
		@anim name=thx opacity=0 time=1500
		@wait time=1500
		@fadeoutbgm time=1500
		@wait time=1600
		
		@eval exp="tf.ending=false"

		@jump storage=title.ks

	[else]
	@s
	
	
	*backtitle
		@cm
		@free name=rabel_credit layer=0
		@clearfix
		@anim name=screen layer=0 top=-580 time=250
		@wait time=255

		@freeimage layer=0
		@awakegame

	[endif]
	@s


;スキップ
*endrollbacktitle
	@cm
	@freeimage layer=1
	@clearfix
	
	@jump storage=title.ks
	@s

