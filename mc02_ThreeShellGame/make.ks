;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;

[iscript]
	//hover処理…！
	$(".game_start").hover(
		function(){
			TG.kag.ftag.startTag("kanim",{name:"game_start",keyframe:"blink_stop",count:"1",time:"1000"})
		},
		function(){
			TG.kag.ftag.startTag("kanim",{name:"game_start",keyframe:"blink",count:"infinite",direction:"alternate",time:"2000"})
		}
	)
[endscript]

;make.ks はロード時にcallとして呼ばれるため、return必須です。
[return]

