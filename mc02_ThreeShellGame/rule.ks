;諸々クリア
	@cm
	@clearstack
	@layopt layer=message0 visible=false
	@freeimage layer=0
	@freeimage layer=1
	@clearfix name="button"
	@stop_keyconfig

	@layopt layer=0 visible=true

	@bg storage ="rule.jpg" time=100

	;戻る
	@button fix=true graphic="back.png" enterimg="back_on.png" target="*backtitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80

*page0
	@cm
	@freeimage layer=0

	;タブ
	@image storage="rule/rule.png" folder=image layer=0 x=200 y=35
	@image storage="rule/mode1_no.png" folder=image layer=0 x=360 y=35 cond="sf.mode_flag<1 || sf.mode_flag==undefined"
	@image storage="rule/mode2_no.png" folder=image layer=0 x=520 y=35 cond="sf.mode_flag<2 || sf.mode_flag==undefined"
	@image storage="rule/mode3_no.png" folder=image layer=0 x=680 y=35 cond="sf.mode_flag<3 || sf.mode_flag==undefined"
	@button graphic="rule/mode1_off.png" enterimg="rule/mode1_on.png" target="*page1" x=360 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=1"
	@button graphic="rule/mode2_off.png" enterimg="rule/mode2_on.png" target="*page2" x=520 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=2"
	@button graphic="rule/mode3_off.png" enterimg="rule/mode3_on.png" target="*page3" x=680 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=3"

	[html top=40 left=80 name="rule,default"]
		<dl>
		<dt>基本ルール</dt>
			<dd>使うカップは3個です。</dd>
			<dd>必ず真ん中のカップにボールを入れてスタートします。</dd>
			<dd>ボールが入ってると思うカップをクリックしてください。</dd>
		</dl>
		
		<dl>
		<dt>ライフ<img src="./data/fgimage/hart.png">について</dt>
			<dd>スタート時のライフは3個です。</dd>
			<dd>ミスするとライフが減ります。</dd>
			<dd>各Levelごとに一度もミスせず正解するとライフが一つ増えます（最大12個）</dd>
			<dd>ライフが0になるとゲームオーバーです。</dd>
		</dl>

		<dl>
		<dt>コンテニューについて</dt>
			<dd>ライフは3個回復します。</dd>
			<dd>コンテニュー時のLevelはノーミス扱いとなります。<br>
				（コンテニュー直後にクリアするとライフが増えます）</dd>
		</dl>
	[endhtml]
	@s


*page1
	@cm
	@freeimage layer=0

	;タブ
	@button graphic="rule/rule_off.png" enterimg="rule/rule_on.png" target="*page0" x=200 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@image storage="rule/mode1.png" folder=image layer=0 x=360 y=35
	@image storage="rule/mode2_no.png" folder=image layer=0 x=520 y=35 cond="sf.mode_flag<2 || sf.mode_flag==undefined"
	@image storage="rule/mode3_no.png" folder=image layer=0 x=680 y=35 cond="sf.mode_flag<3 || sf.mode_flag==undefined"
	@button graphic="rule/mode2_off.png" enterimg="rule/mode2_on.png" target="*page2" x=520 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=2"
	@button graphic="rule/mode3_off.png" enterimg="rule/mode3_on.png" target="*page3" x=680 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=3"

	[html top=40 left=80 name="rule,endless"]
		<dl>
		<dt>エンドレスモードについて</dt>
			<dd>スピード・シャッフル回数はLevel10と同じです。<br>
			※ハイパーモードをプレイすると最速スピードでプレイできます。</dd>
			<dd>ミスをしてもライフの増減はありません。</dd>
			<dd>プレイ回数はカウントします。</dd>
		</dl>

		<dl>
		<dt>解放条件</dt>
			<dd>Level 10 クリア</dd>
		</dl>

		<dl class="hint">
		<dt>モード2解放のヒント</dt>
			<dd>通常モードでライフをなるべくたくさん残すといいかも？</dd>
		</dl>
	[endhtml]
	@s


*page2
	@cm
	@freeimage layer=0

	;タブ
	@button graphic="rule/rule_off.png" enterimg="rule/rule_on.png" target="*page0" x=200 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@button graphic="rule/mode1_off.png" enterimg="rule/mode1_on.png" target="*page1" x=360 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@image storage="rule/mode2.png" folder=image layer=0 x=520 y=35
	@image storage="rule/mode3_no.png" folder=image layer=0 x=680 y=35 cond="sf.mode_flag<3 || sf.mode_flag==undefined"
	@button graphic="rule/mode3_off.png" enterimg="rule/mode3_on.png" target="*page3" x=680 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg cond="sf.mode_flag>=3"

	[html top=40 left=80 name="rule,challenge"]

		<dl>
		<dt>チャレンジモードについて</dt>
			<dd>連続正解にチャレンジするモードです。</dd>
			<dd>スピード・シャッフル回数はLevel10と同じです。<br>
			※ハイパーモードをプレイすると最速スピードでプレイできます。</dd>
			<dd>一回ミスするとゲームオーバーです。</dd>
			<dd>最大の連続正解数はセーブデータに表示しますが、保存はしません。<br>
			毎回0回からのスタートとなります。</dd>
			<dd>プレイ回数はカウントします。</dd>
		</dl>

		<dl>
		<dt>解放条件</dt>
			<dd>ライフを7個以上残してクリア</dd>
		</dl>

		<dl class="hint">
		<dt>モード3解放のヒント</dt>
			<dd>どう言い換えてもヒントにならないのでズバリ！<br>通常モードを「ノーミス」でクリアだよ～</dd>
		</dl>

	[endhtml]
	@s


*page3
	@cm
	@freeimage layer=0

	;タブ
	@button graphic="rule/rule_off.png" enterimg="rule/rule_on.png" target="*page0" x=200 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@button graphic="rule/mode1_off.png" enterimg="rule/mode1_on.png" target="*page1" x=360 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@button graphic="rule/mode2_off.png" enterimg="rule/mode2_on.png" target="*page2" x=520 y=35 clickse=Onmtp-Click02-1.ogg enterse=Accent32-1.ogg
	@image storage="rule/mode3.png" folder=image layer=0 x=680 y=35

	[html top=40 left=80 name="rule,hyper"]
		<dl>
		<dt>ハイパーモードについて</dt>
			<dd>シャッフルスピードの限界にチャレンジするモードです。</dd>
			<dd>ミスした場合は同じスピードに再チャレンジできます。</dd>
			<dd>正解時の最大スピードは保存されます。<br>
			次回プレイ時に最大スピードでプレイを開始できます。<br>
			※最大スピードが150以下になると、モード選択画面にスピード選択ボタンが表示されます。
			</dd>
			<dd>プレイ回数はカウントします。</dd>
		</dl>

		<dl>
		<dt>解放条件</dt>
			<dd>ノーミスでクリア</dd>
		</dl>
		<dl>
	[endhtml]
	@s


*backtitle
	@cm
	@freeimage layer=1
	@freeimage layer=0
	@clearfix
	@awakegame
	@s
