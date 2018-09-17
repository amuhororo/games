; 2017/06/09 ko10panda edit
;=========================================
; コンフィグ
;=========================================
	[layopt layer=message0 visible=false]
	[stop_keyconfig]
	[clearfix name="button"]

	[iscript]
		$(".layer_camera").empty(); // 全レイヤ消去
	[endscript]

	[hidemenubutton]

	[iscript]
		//TG.config.autoRecordLabel = "true"; // ラベル通過記録を有効に
		tf.current_bgm_vol = parseInt(TG.config.defaultBgmVolume); // BGM Volume
		tf.default_bgm_vol = parseInt(TG.config.defaultBgmVolume); // BGM Volume
		tf.current_se_vol = parseInt(TG.config.defaultSeVolume); // SE Volume
		tf.default_se_vol = parseInt(TG.config.defaultSeVolume); // SE Volume
		//tf.current_ch_speed = parseInt(TG.config.chSpeed); // Text Speed
		//tf.current_auto_speed = parseInt(TG.config.autoSpeed); // Auto Text Speed
		//tf.text_skip = 'ON';
		//if(TG.config.unReadTextSkip != "true"){tf.text_skip = 'OFF';} // unReadTextSkip
		if(!sf.tutorial_skip)sf.tutorial_skip = false;
	[endscript]

[cm]
;コンフィグ用の背景を読み込んでトランジション
[bg storage="config.jpg" time=100]

;[jump target="*config_page"]

;-----------------------------------------------------------------------------------------------------
*config_page
;[clearfix]
[cm]
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[freeimage layer="0" time="0"]

;画面右上の「Back」ボタン(配置場所やボタンの大きさはお好みで)
[button graphic="back.png" enterimg="back_on.png" target="*backtitle" x=860 y=540 clickse=cancel2.ogg enterse=Accent32-1.ogg width=80]

	;フルスクリーンボタン
	;@button fix=true name="fullscreen" role="fullscreen" graphic=&f.screenfull enterimg=&f.screenfull_on x=18 y=560 clickse=cancel2.ogg enterse=Accent32-1.ogg width=65

;▼スライダー両端の文字類（※必要なければ削除してやってください）
[ptext layer="0" x="210" y="208" bold="true" color="0xbb3a4b" size="16" text="MIN"]
[ptext layer="0" x="590" y="208" bold="true" color="0xbb3a4b" size="16" text="MAX"]
[ptext layer="0" x="210" y="348" bold="true" color="0xd59b09" size="16" text="MIN"]
[ptext layer="0" x="590" y="348" bold="true" color="0xd59b09" size="16" text="MAX"]
/*
[ptext layer="0" x="315" y="356" bold="true" color="0x93b11c" size="11" text="SLOW"]
[ptext layer="0" x="694" y="356" bold="true" color="0x93b11c" size="11" text="FAST"]
[ptext layer="0" x="315" y="426" bold="true" color="0x00789a" size="11" text="SLOW"]
[ptext layer="0" x="694" y="426" bold="true" color="0x00789a" size="11" text="FAST"]
*/
;▼現在のパラメータ（上からBGM、SE、テキスト速度、オート速度、既読スキップ）
[ptext layer=0 x=200 y=160 bold="true" color="0xbb3a4b" size=22 name="slider_text" text="BGM&nbsp;ボリューム"]
[ptext layer=0 x=200 y=300 bold="true" color="0xd59b09" size=22 name="slider_text" text="SE&nbsp;ボリューム"]
;▼現在のパラメータ（上からBGM、SE、テキスト速度、オート速度、既読スキップ）
[ptext layer=0 right=260 y=201 bold="true" color="0xbb3a4b" size=22 name="slider_text_bgm" text="&tf.current_bgm_vol == 0 ? 'Mute' : tf.current_bgm_vol + '%'"]
[ptext layer=0 right=260 y=341 bold="true" color="0xd59b09" size=22 name="slider_text_se" text="&tf.current_se_vol == 0 ? 'Mute' : tf.current_se_vol + '%'"]

/*
[ptext layer=0 x=740 y=345 bold="true" color="0x93b11c" size=22 name="slider_text_speed" text="&tf.current_ch_speed + 'ms'"]
[ptext layer=0 x=740 y=415 bold="true" color="0x00789a" size=22 name="slider_text_auto" text="&tf.current_auto_speed + 'ms'"]
*/

[ptext layer=0 left=205 top=440 bold="true" color="0x00789a" size=22 name="slider_text" text="チュートリアル&nbsp;スキップ"]


;▼ミュート画像（オン・オフの両方を読み込み、画像の可視・不可視をjQueryで調整しています）
[freeimage layer="1" time="0"]
[image name="mute_bgm_off" storage="mute_off.png" layer="1" width="50" height="50" right=185 y="190"]
[image name="mute_bgm_on" storage="mute_on_bgm.png" layer="1" width="50" height="50" right=185 y="190"]
[image name="mute_se_off" storage="mute_off.png" layer="1" width="50" height="50" right=185 y="330"]
[image name="mute_se_on" storage="mute_on_se.png" layer="1" width="50" height="50" right=185 y="330"]

;▼ミュートボタン
[button graphic="space.png" right=185 y="190" width="50" height="50" target="*bgm_mute" clickse=decision3.ogg enterse=Accent32-1.ogg]
[button graphic="space.png" right=185 y="330" width="50" height="50" target="*se_mute" clickse=decision3.ogg enterse=Accent32-1.ogg]

[iscript]
	// ミュート画像の判定
	if(tf.current_bgm_vol != 0){$(".mute_bgm_on").hide();$(".mute_bgm_off").show();}else{$(".mute_bgm_off").hide();$(".mute_bgm_on").show();}
	if(tf.current_se_vol != 0){$(".mute_se_on").hide();$(".mute_se_off").show();}else{$(".mute_se_off").hide();$(".mute_se_on").show();}
[endscript]

[iscript]

/* BGM Vol */
	$(".layer_free").append('<div id="slider_bgm" class="slider"></div>');
	var val_bgm = tf.current_bgm_vol;
	$("#slider_bgm").slider({
		orientation: "horizontal",
		animate: "fast",
		range: "min",
		min: 0,
		max: 100,
		value: val_bgm,
		step: 1,
		slide: function(event, ui){
			$(".slider_text_bgm").text(ui.value == 0 ? 'Mute' : ui.value + '%');
				TG.ftag.startTag("bgmopt", {volume: ui.value});
				TG.ftag.startTag("playse",{storage:"decision3.ogg"});
				tf.current_bgm_vol = ui.value;
				if(TG.config["defaultBgmVolume"] != 0){$(".mute_bgm_on").hide();$(".mute_bgm_off").show();}else{$(".mute_bgm_off").hide();$(".mute_bgm_on").show();}
		}
	});

/* SE Vol */
	$(".layer_free").append('<div id="slider_se" class="slider"></div>');
	var val_se = tf.current_se_vol;
	$("#slider_se").slider({
		orientation: "horizontal",
		animate: "fast",
		range: "min",
		min: 0,
		max: 100,
		value: val_se,
		step: 1,
		slide: function(event, ui){
				$(".slider_text_se").text(ui.value == 0 ? 'Mute' : ui.value + '%');
				TG.ftag.startTag("seopt", {volume: ui.value});
				TG.ftag.startTag("playse",{storage:"decision3.ogg"});
				tf.current_se_vol = ui.value;
				if(TG.config["defaultSeVolume"] != 0){$(".mute_se_on").hide();$(".mute_se_off").show();}else{$(".mute_se_off").hide();$(".mute_se_on").show();};
		}
	});

/*チュートリアルスキップ*/
	$(".layer_free").append('<div class="switch_skip"></div>');

		// skip ON
		function unread_skip_on(){
			sf.tutorial_skip = true;
	}

		// skip OFF
		function unread_skip_off(){
			sf.tutorial_skip = false;
		}

	if(sf.tutorial_skip == true){
		$(".switch_skip").toggleClass("switch_skip_active");
	}

	$(".switch_skip").click(function(){
		$(this).toggleClass("switch_skip_active");
		$(this).hasClass("switch_skip_active") ? unread_skip_on() : unread_skip_off();
		TG.ftag.startTag("playse",{storage:"decision3.ogg"});
	});

	$(".ui-slider-handle").hover(
		function () {
			TG.ftag.startTag("playse",{storage:"Accent32-1.ogg"});
		},
	  function () {}
	);
	$(".switch_skip").hover(
		function () {
			TG.ftag.startTag("playse",{storage:"Accent32-1.ogg"});
		},
	  function () {}
	);
		
[endscript]

[s]

;--------------------------------------------------------------------------------
; BGMミュート処理
;--------------------------------------------------------------------------------
*bgm_mute
[if exp="tf.current_bgm_vol!=0"]
	[eval exp="tf.default_bgm_vol = tf.current_bgm_vol"]
	[eval exp="tf.current_bgm_vol = 0"]
	[bgmopt volume="0"]
[elsif exp="tf.default_bgm_vol==0"]
	[eval exp="tf.current_bgm_vol = 50"]
	[bgmopt volume="50"]
[else]
	[eval exp="tf.current_bgm_vol = tf.default_bgm_vol"]
	[bgmopt volume=&tf.default_bgm_vol]
[endif]
[jump target="*config_page"]
[s]

;--------------------------------------------------------------------------------
; SEミュート処理
;--------------------------------------------------------------------------------
*se_mute
[if exp="tf.current_se_vol!=0"]
	[eval exp="tf.default_se_vol = tf.current_se_vol"]
	[eval exp="tf.current_se_vol = 0"]
	[seopt volume="0"]
[elsif exp="tf.default_se_vol==0"]
	[eval exp="tf.current_se_vol = 50"]
	[seopt volume="50"]
[else]
	[eval exp="tf.current_se_vol = tf.default_se_vol"]
	[seopt volume=&tf.default_se_vol]
[endif]
[jump target="*config_page"]
[s]

;--------------------------------------------------------------------------------
; コンフィグを抜ける
;--------------------------------------------------------------------------------
*backtitle
[cm]
[clearfix]
[freeimage layer="0" time="0"]
[freeimage layer="1" time="0"]
[awakegame]
