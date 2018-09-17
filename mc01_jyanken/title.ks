[cm]

@clearstack
@bg storage ="title.png" time=300
@wait time = 200

@layopt layer=1 visible=true

*start 

[button x=140 y=304 graphic="title/button_start.gif" target="gamestart"]
;[button x=166 y=408 graphic="title/button_cg.gif"  storage=cg.ks"]
;[button x=544 y=304 graphic="title/button_config.gif" storage="config.ks"]
;[button x=486 y=304 graphic="title/button_load.gif" role="load"]
;[button x=486 y=408 graphic="title/button_replay.gif" storage="replay.ks"]


;//コンフィグ
;[ptext layer=1 text="コンフィグ" x=550 y=270 size=28 color=0x000000 visible=true]
[ptext layer=1 x=520 y=280 size=20 text="文字速度" color=0xA8401C]
[ptext layer=1 x=615 y=280 size=20 name="jquery-ui-slider-text" color=0xA8401C text=""]
[ptext layer=1 x=665 y=255 size=11 text="おそい" color=0xA8401C]
[ptext layer=1 x=865 y=255 size=11 text="はやい" color=0xA8401C]

[ptext layer=1 x=520 y=345 size=20 text="OPスキップ" color=0xA8401C]
[ptext layer=1 x=520 y=410 size=20 text="説明スキップ" color=0xA8401C]

[wait time=1]

[iscript]
//文字速度
$('.layer_free').append('<div id="slider"></div>');
$('#slider').css("width","200px").css("top","283px").css("left","680px");
$('.jquery-ui-slider-text').css("waidth","2em");
var val = 100 - TG.config["chSpeed"];
$('#slider').slider( {
	orientation: "horizontal",
	animate: 'slow',
	range: 'min',
	value: val,
	min: 50,
	max: 95,
	step:5,
	slide: function( event, ui ) {
		$( '.jquery-ui-slider-text' ).text( 100 - ui.value );
		TG.config["chSpeed"] = 100 - ui.value;
		TG.ftag.startTag("configdelay",{speed:100 - ui.value});
	}
} );
$( '.jquery-ui-slider-text' ).text( TG.config["chSpeed"] );


//OPスキップ
if(TG.variable.sf.opskip == true) var op = "on.gif"
else var op = "off.gif"
$('.layer_free').append('<div class="opskip"><img src=data/image/config/'+ op +'></div>');
$('.opskip').css("width","200px").css("top","335px").css("left","680px").css("position","absolute");
$('.opskip').find('img').css('cursor', 'pointer');

$('.opskip').find('img').click(function () {
	if(sf.opskip == true){
		TG.kag.ftag.startTag("eval",{"exp":sf.opskip = false});
		$('.opskip').find('img').attr('src', 'data/image/config/off.gif');
	}else{
		TG.kag.ftag.startTag("eval",{"exp":sf.opskip = true});
		$('.opskip').find('img').attr('src', 'data/image/config/on.gif');
	}
});

//説明スキップ
var info = (sf.info == true) ? "on.gif" : "off.gif";
$('.layer_free').append('<div class="info"><img src=data/image/config/'+ info +'></div>');
$('.info').css("width","200px").css("top","400px").css("left","680px").css("position","absolute");
$('.info').find('img').css('cursor', 'pointer');
$('.info').find('img').click(function () {
	if(sf.info == true){
		TG.kag.ftag.startTag("eval",{"exp":sf.info = false});
		$('.info').find('img').attr('src', 'data/image/config/off.gif');
	}else{
		TG.kag.ftag.startTag("eval",{"exp":sf.info = true});
		$('.info').find('img').attr('src', 'data/image/config/on.gif');
	}
});
[endscript]


//コピーライト的な
[ptext layer=1 name="copy" page=fore text="「一騎打ちテスト」&ensp;by&ensp;めも調&ensp;hororo&ensp;http://hororo.wp.xdomain.jp/" x=25 y=600 size=16 color=0x603213 visible=true]


;//エンディングリスト
[ptext layer=1 page=fore text="End List" x=80 y=460 size=30 color=0x000000 visible=true]
[if exp="sf.end1==true && sf.end2==true && sf.end3==true && sf.end4==true && sf.end5==true"]
[ptext layer=1 page=fore text="Complete!" x=200 y=464 size=26 color=0xA8401C visible=true]
[endif]

[if exp="sf.end1==true"]
[glink color="red" size="20" width=120 x="80" y="520" text="END1" exp="tf.endlist='end1'" storage=scene1.ks]
[else]
[ptext layer=1 page=fore text="No Data" x=90 y=526 size=24 color=0xA8401C visible=true]
[endif]

[if exp="sf.end2==true"]
[glink color="red" size="20" width=120 x="250" y="520" text="END2" exp="tf.endlist='end2'" storage=scene1.ks]
[else]
[ptext layer=1 page=fore text="No Data" x=260 y=526 size=24 color=0xA8401C visible=true]
[endif]

[if exp="sf.end3==true"]
[glink color="red" size="20" width=120 x="420" y="520" text="END3" exp="tf.endlist='end3'" storage=scene1.ks]
[else]
[ptext layer=1 page=fore text="No Data" x=430 y=526 size=24 color=0xA8401C visible=true]
[endif]

[if exp="sf.end4==true"]
[glink color="red" size="20" width=120 x="590" y="520" text="END4" exp="tf.endlist='end4'" storage=scene1.ks]
[else]
[ptext layer=1 page=fore text="No Data" x=600 y=526 size=24 color=0xA8401C visible=true]
[endif]

[if exp="sf.end5==true"]
[glink color="red" size="20" width=120 x="760" y="520" text="END5" exp="tf.endlist='end5'" storage=scene1.ks]
[else]
[ptext layer=1 page=fore text="No Data" x=770 y=526 size=24 color=0xA8401C visible=true]
[endif]

[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
@eval exp="tf.endlist=''"
@jump storage="scene1.ks"



