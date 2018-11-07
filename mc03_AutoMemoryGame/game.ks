
*start

[cm  ]
[clearfix]

[eval exp="f.gamever=TG.config.game_version"]

[html name="game_setting" left=0 top=0]
  <div class="title frame">
    オート神経衰弱<span>ver.[emb exp=f.gamever]</span>
    <p class="messe">
      ペアになったカードの上下左右のカードが自動で開きペア判定をしていきます。<br>
      同一の絵柄が複数ある場合は、左上から順に判定をします。<br>
      幻想水滸伝のジョルジュのミニゲーのつもり。
    </p>
  </div>

  <div class="config frame">
    <p>ゲーム設定</p>
    <div id="card_imgnum">
      <label for="card_imgnum">絵柄の種類</label>
      <select name="card_typenum">
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
      </select>
    </div>

  <div id="card_column">
    <label for="card_column">横のカード枚数</label>
    <select name="card_column">
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
    </select>
  </div>

  <div id="card_line">
    <label for="card_line">縦のカード枚数</label>
    <select name="card_line">
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
    </select>
  </div>

  </div>
[endhtml]

[iscript]
  //変数設定
  if(!f.card_img) f.card_img = 5;                              //柄数
  if(!f.card_column) f.card_column = 7;                        //列数
  if(!f.card_line) f.card_line = 6;                            //行数

  //ゲーム設定
  $("#card_imgnum select").val(f.card_img);
  $("#card_column select").val(f.card_column);
  $("#card_line select").val(f.card_line);
  for(var i=2; i<=11; i++){ //画面はみ出る行数と奇数になる行数は選べないように
    if(i >= f.card_column || f.card_column*i%2==1) $('#card_line select option[value="'+i+'"]').hide();
  }
  //select選択時のイベント
  $('#card_imgnum').change(function() {
    f.card_img = $('#card_imgnum select').val();
  });
  $('#card_column select,#card_line select').change(function() {
    var column = $('#card_column select').val();
    if( parseInt(column)<f.card_column && f.card_line>=parseInt(column)) {
      $("#card_line select").val(column-1);
    }
    f.card_column = $('#card_column select').val();
    f.card_line = $('#card_line select').val();
    for(var i=2; i<=11; i++){
      if(i >= f.card_column || f.card_column*i%2==1) $('#card_line select option[value="'+i+'"]').hide();
      else $('#card_line select option[value="'+i+'"]').show();
    }
  });
[endscript]

@button x=760 y=40 graphic="button_credit.png" target="credit"
@button x=350 y=435 graphic="button_start.png" enterimg="button_start_on.png" target="game"
@button x=800 y=530 fix=true graphic="screen.png" enterimg="screen2.png" role=fullscreen

[s]




*game
[cm  ]
;[clearfix]

@button x=760 y=40 graphic="button_back.png" enterimg="button_back_on.png" target="start"

[iscript]
  $(".layer_free").append("<ul id='card'></ul>");
  $(".layer_free").append("<div class='frame playtime'>タイム<span>00:00.0</span></div>");
  $(".layer_free").append("<div class='frame card_num'>絵柄<span>"+f.card_img+"</span>種</div>");
  $(".layer_free").show();

  //タイマー
  f.playtime = 0;
  f.playtime_disp = 0;
  f.playtime_counting = false;
  var GameTime = setInterval(function(){
    if(f.playtime_counting==true){
      ++f.playtime;
      min = parseInt((f.playtime / 600) % 60);
			sec = parseInt((f.playtime/10)) % 60;
      msec = f.playtime % 10;
			if(min < 10) { min = "0" + min; }
			if(sec < 10) { sec = "0" + sec; }
      f.playtime_disp = min + ':' + sec + '.' + msec;
			$(".playtime span").text(f.playtime_disp);
    }
  }, 100);

  //変数指定
  f.card_total = f.card_column * f.card_line;                  //総数
  f.card_rem = Math.floor(f.card_total%(f.card_img*2));        //余り
  f.card_typenum = Math.floor(f.card_total/(f.card_img*2))*2;  //1種当たりの枚数

  f.card = {};
  f.card.num  = [];                                //カード配列
  f.card.flag = [];                                //取得済みチェック用

  f.card_select = [];                              //選択したカード
  f.card_index  = [];                              //カードの位置
  f.card_autoOP = [];                              //自動で開くカード

  f.index = [];                                    //選択した全てのカードの位置
  f.card_width = Math.ceil((TG.config.scWidth*0.69)/f.card_column);  //カードサイズ横
  f.card_height = "";                              //カードサイズ縦

  //個別処理用
  tf.first = true;                                 //1枚目か
  tf.index = "";                                   //クリックしたカードの位置
  tf.line = [];                                    //カードの位置(行)
  tf.column = [];                                  //カードの位置(列)
  tf.card_open = [];                               //自動で開くカード

  //カードを用意
  for(var i=1; i<=f.card_img; i++) {
    var n = (f.card_rem > 0 && i<=f.card_rem/2) ?f.card_typenum +2 : f.card_typenum ;
    for(var j=1; j<= n; j++) {
      f.card.num.push(i);       //カードの種類
      f.card.flag.push(false);  //フラグ
    }
  }
  //カードをシャッフル
  f.card.num.sort(function() {
    return Math.random() - Math.random();
  });

  //カードを並べる
  for(var i=1; i<=f.card_total; i++) {
    $("#card").append("<li style='opacity:0'><img src='./data/image/card.png'></li>");
  }
  //カードサイズ取得
  $("#card li img:eq("+(f.card_total-1)+")").one('load',function(){
    var img = new Image();
    img.src = "./data/image/card.png";
    var width = img.width;
    var height = img.height;
    f.card_height = Math.round(f.card_width*(height/width));            //カードサイズ縦
    $("#card").css({"width":"70%","height":parseInt(TG.config.scHeight)+"px"}); //カード全体の表示領域
    $("#card").find("li").css({"width":f.card_width+"px","height":f.card_height+"px"}); //カードサイズ
  });
  $("#card li").each(function(i){
    $(this).delay(30*i).animate({opacity:'1'}, 1);
  });

  //カードを閉じる
  function cardClose(i,n){
    $("#card li:eq("+i+") img").stop().animate({ width: "0",height: f.card_height+"px",left: "47"}, 150,
    function(){
      n(i);
    });
  }
  //カードを開く
  function cardOpen(i){
    $("#card li:eq("+i+") img").attr("src","./data/image/card_"+f.card.num[i]+".png");
    $("#card li:eq("+i+") img").stop().animate({ width: f.card_width+"px",height: f.card_height+"px",left: "0"}, 150);
  }
  //裏面にする
  function cardUra(j){
    $("#card li:eq("+j+") img").attr("src","./data/image/card.png");
    $("#card li:eq("+j+") img").stop().animate({ width: f.card_width+"px",height: f.card_height+"px",left: "0"}, 150);
  }

  //カードロック
  function cardlock(){
    $("#card li:eq("+tf.index+")").addClass("lock");
  }
  //全てのカードをロック
  function alllock(){
    $("#card li").addClass("lock");
  }
  //全てのカードをアンロック
  function unlock(){
    $("#card li").removeClass("lock");
  }

  //クリックイベント
  var e = ($.userenv()=="pc") ? "click" : "touchstart" ;
  $("#card li").on(
    e,function(){
      if(f.playtime_counting == false) f.playtime_counting = true;
      tf.index = $("#card li").index(this);
      $("#card li:eq("+tf.index+")").addClass("lock");
      //cardlock();
      cardClose(tf.index,cardOpen);
      if(tf.first == true){
        f.card_index[0] = tf.index;
        tf.first = false;
      } else {
        tf.first = true;
        f.card_index[1] = tf.index;
        $("#card li").addClass("lock");
        //alllock();
        cardcheck();
      }
    }
  );

  //選択したカードをチェック
  function cardcheck() {
    //重複削除
    f.card_index = f.card_index.filter(function (x, i, self) {
      return self.indexOf(x) === i;
    });
    //ソート
    f.card_index= f.card_index.sort(function(a,b){
      return (a < b ? -1 : 1);
    });

    for(var i=0; i < f.card_index.length; i++){
      f.card_select[i] = f.card.num[f.card_index[i]];
    }

    //同じカードが何枚あるか
    var count = function(arr){
      return arr.reduce(function(counts, key){
        counts[key] = (counts[key])? counts[key] + 1 : 1 ;
        return counts;
      }, {});
    };
    var open = count(f.card_select);

    //カードを別ける
    var hit_card = [];    //ペア
    var close_card = [];  //非ペア
    var Re = [];          //繰り返しチェック用
    for(var i=0; i<f.card_index.length; i++){
      var key = f.card_select[i];
      var index = f.card_index[i];
      var current = -1;
      var c = 0;
      if(Re[key] != true){ //同じkeyだったらスルー
        do {
          current = $.inArray(key, f.card_select, current + 1);
          if (current !== -1) {
            if(open[key] > 1 || open[key]%2 == 0){
              c++;
              if(open[key]%2 == 1 && open[key]-c == 0){
                close_card.push(f.card_index[current]);
              } else {
                hit_card.push(f.card_index[current]);
                //f.card.flag[f.card_index[current]] = true;
                Re[key] = true; //繰り返し防止
              }
            } else if(open[key] == 1) {
              close_card.push(f.card_index[current]);
            }
          }
        } while (current !== -1);
      }
    }

    //配列をクリア
    f.card_index = [];
    f.card_select = [];
    var time = 1;

    //揃わないカードを閉じる
    if(close_card.length > 0){
      time = 2;
      setTimeout(function(){
        for(var i=0; i<close_card.length; i++){
          cardClose(close_card[i],cardUra);  //カードを裏面に戻す
          //$(".test").text(tf.first);
        }
      }, 800);
    }

    //揃ってるカード
    if(hit_card.length > 0){
      setTimeout(function(){
        var p = [];
        var column = parseInt(f.card_column);
        for(var i=0; i<hit_card.length; i++){
          //自動で開くカードを取得
          tf.line[i] = Math.floor(hit_card[i]/column);
          tf.column[i] = hit_card[i]-(tf.line[i]*column);
          if(tf.line[i]>0)                 p.push(parseInt(hit_card[i])-column);//上
          if(tf.line[i]<(f.card_line-1))   p.push(parseInt(hit_card[i])+column);//下
          if(tf.column[i]>0)               p.push(parseInt(hit_card[i])-1);     //左
          if(tf.column[i]<column-1)        p.push(parseInt(hit_card[i])+1);     //右
          //カードを消す
          f.card.flag[hit_card[i]] = true;
          $("#card li:eq("+hit_card[i]+")").addClass("off");
        }
        //すでにOPEN済みのカードを除外
        for(var i=0; i<p.length; i++){
          if(f.card.flag[p[i]]==false){
            f.card_index.push(p[i]);  //開いたカードを保存
            cardClose(p[i],cardOpen); //カードを開く
          }
        }

        //自動で開くカードが
        if(f.card_index.length>0) {//ある場合
          cardcheck();//もっかいカードチェック
        } else {//ない場合
          if($.inArray(false, f.card.flag) == -1){//最後のカードがめくられたら
            f.playtime_counting = false;//タイマー止める
            $("#card li img").each(function(i){//カード時間差で表示
              $(this).delay(30*i).animate({opacity:'1'},1);
            });
            clearInterval(GameTime);
            setTimeout(function(){  //クリアアラート
              //alert("クリアー！　タイム "+f.playtime_disp);
              $(".remodal").find(".remodal-confirm").html("タイトルに戻る");
              $(".remodal").find(".remodal-cancel").html("もう一回！");
              $(".remodal-overlay,.remodal-wrapper").css("z-index",99999999);//フリーレイヤーの上に表示
              $.confirm("クリアー！　タイム "+f.playtime_disp,
                function(){
                  TG.kag.ftag.startTag("jump", {"target":"start"});
                },
                function(){
                  TG.kag.ftag.startTag("jump", {"target":"game"});
                }
              );
            }, 30*f.card_total+200);
          } else unlock();  //全てのカードの.lockを削除
        }
      }, 800*time);
    }else{
      unlock();  //全てのカードの.lockを削除
    }
  }
[endscript]

[s]



*credit
[cm  ]
;[clearfix]

@button x=760 y=40 graphic="button_back.png" enterimg="button_back_on.png" target="start"

[html name="credit,frame" left=60 top=220]
<p>使用させて頂きました。</p>
<dl>
<dt>いらすとや</dt>
<dd><a href="http://www.irasutoya.com/" target=_blank>http://www.irasutoya.com/</a></dd>
<dt>フキダシデザイン</dt>
<dd><a href="http://fukidesign.com/" target=_blank>http://fukidesign.com/</a></dd>
<dt>Frame Design</dt>
<dd><a href="http://frames-design.com/" target=_blank>http://frames-design.com/</a></dd>
<dt>フォントな 「ラノベPOP」</dt>
<dd><a href="http://www.fontna.com/blog/1706/" target=_blank>http://www.fontna.com/blog/1706/</a></dd>
<dt>ティラノスクリプト Ver470_rc4</dt>
<dd><a href="https://tyrano.jp/" target=_blank>https://tyrano.jp/</a></dd>
</dl>
[endhtml]
[s]
