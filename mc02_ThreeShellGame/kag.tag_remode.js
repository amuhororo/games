// 改造タグ
//■ptext■
tyrano.plugin.kag.tag.ptext.vital = ["layer"]
tyrano.plugin.kag.tag.ptext.start = function(pm) {

	var that = this;

	if(pm.face ==""){
		pm.face=that.kag.stat.font.face;
	}
	if(pm.color == ""){
		pm.color=$.convertColor(that.kag.stat.font.color);
	}else{
		pm.color = $.convertColor(pm.color);
	}
	var font_new_style = {
		"color" : pm.color,
		"font-weight" : pm.bold,
		"font-style" : pm.fontstyle,
		"font-size" : pm.size + "px",
		"font-family" : pm.face,
		"z-index" : "999",
		"text" : ""
	};
	
	if(pm.edge !=""){
		var edge_color = $.convertColor(pm.edge);
		font_new_style["text-shadow"] = "1px 1px 0 "+edge_color+", -1px 1px 0 "+edge_color+",1px -1px 0 "+edge_color+",-1px -1px 0 "+edge_color+"";
	}else if(pm.shadow !=""){
		font_new_style["text-shadow"] = "2px 2px 2px " + $.convertColor(pm.shadow);
	}
		
	var target_layer = this.kag.layer.getLayer(pm.layer, pm.page);
	
	if (pm.overwrite == "true" && pm.name != "") {
		if ($("." + pm.name).size() > 0) {
			$("." + pm.name).html(pm.text);
			this.kag.ftag.nextOrder();
			return false;
		}
	}
	var tobj = $("<p></p>");
	tobj.css("position", "absolute");
	if(pm.y)tobj.css("top", pm.y + "px");
	if(pm.x)tobj.css("left", pm.x + "px");
	if(pm.top)tobj.css("top", pm.top + "px");
	if(pm.left)tobj.css("left", pm.left + "px");
	if(pm.bottom)tobj.css("bottom", pm.bottom + "px");
	if(pm.right)tobj.css("right", pm.right + "px");
	tobj.css("width", pm.width); //◆デフォルト100%
	tobj.css("text-align", pm.align);
	if (pm.vertical == "true") {
		tobj.addClass("vertical_text");
	}
	$.setName(tobj, pm.name);
	tobj.html(pm.text);
	this.kag.setStyles(tobj, font_new_style);
	if(pm.layer=="fix"){
            tobj.addClass("fixlayer");
	}
	if(pm.time != ""){
		tobj.css("opacity",0);
		target_layer.append(tobj);
		tobj.animate(
			{"opacity":1},
			parseInt(pm.time), 
			function(){
				that.kag.ftag.nextOrder();
			}
		);
	}else{
		this.kag.ftag.nextOrder();
		target_layer.append(tobj);
	}
        
	//◆センタリング
	if (pm.x == "center" || pm.left=="center") {
		var x = (parseInt(that.kag.config.scWidth,10) - parseInt(tobj.outerWidth(),10))*0.5;
		tobj.css("left", x + "px");
	}
	if (pm.y == "center" || pm.top=="center") {
		var y = (parseInt(that.kag.config.scHeight,10) - parseInt(tobj.outerHeight(),10))*0.5;
		tobj.css("top", y + "px");
	}
};


//■mtext■
tyrano.plugin.kag.tag.mtext.start = function(pm) {
	var that = this;

	if(pm.face ==""){
		pm.face=that.kag.stat.font.face;
	}
	if(pm.color == ""){
		pm.color=$.convertColor(that.kag.stat.font.color);
	}else{
		pm.color = $.convertColor(pm.color);
	}
	var font_new_style = {
		"color" : pm.color,
		"font-weight" : pm.bold,
		"font-style" : pm.fontstyle,
		"font-size" : pm.size + "px",
		"font-family" : pm.face,
		"z-index" : "999",
		"text" : ""
	};
	if(pm.edge !=""){
		var edge_color = $.convertColor(pm.edge);
		font_new_style["text-shadow"] = "1px 1px 0 "+edge_color+", -1px 1px 0 "+edge_color+",1px -1px 0 "+edge_color+",-1px -1px 0 "+edge_color+"";
	}else if(pm.shadow !=""){
		font_new_style["text-shadow"] = "2px 2px 2px " + $.convertColor(pm.shadow);
	}
	var target_layer = this.kag.layer.getLayer(pm.layer, pm.page);
	var tobj = $("<p></p>");
	tobj.css("position", "absolute");
	tobj.css("top", pm.y + "px");
	tobj.css("left", pm.x + "px");
	tobj.css("top", pm.top + "px");
	tobj.css("left", pm.keft + "px");
	tobj.css("bottom", pm.bottom + "px");
	tobj.css("right", pm.right + "px");
	tobj.css("width", "auto"); //◆デフォルト100%
	if (pm.vertical == "true") {
		tobj.addClass("vertical_text");
	}
	$.setName(tobj, pm.name);
	tobj.html(pm.text);
	this.kag.setStyles(tobj, font_new_style);
	if(pm.layer=="fix"){
		tobj.addClass("fixlayer");
	}
	target_layer.append(tobj);
	for(key in pm){
		if(pm[key]=="true"){
			pm[key] = true;
		}else if(pm[key] =="false"){
			pm[key] = false;
		}
	}
	tobj.textillate({ 
		"loop":pm["fadeout"],
		"minDisplayTime":pm["time"],
 		"in": { 
			"effect":pm["in_effect"], 
			"delayScale":pm["in_delay_scale"],
			"delay":pm["in_delay"],
			"sync":pm["in_sync"],
			"shuffle":pm["in_shuffle"],
			"reverse":pm["in_reverse"],
			"callback":function(){
				if (pm.fadeout==false && pm.wait == true) {
					that.kag.ftag.nextOrder();
				}
			}
		},
		"out": {
			"effect": pm["out_effect"], 
			"delayScale": pm["out_delay_scale"],
			"delay": pm["out_delay"],
			"sync": pm["out_sync"],
			"shuffle": pm["out_shuffle"],
			"reverse": pm["out_reverse"],
			"callback":function(){
				tobj.remove();
				if (pm.wait == true) {
					that.kag.ftag.nextOrder();
				}
			}
		}
	});
	if(pm.wait != true){
		this.kag.ftag.nextOrder();
	}

	//◆センタリング
	if (pm.x == "center") {
		var x = (parseInt(that.kag.config.scWidth,10) - parseInt(tobj.outerWidth(),10))*0.5;
		tobj.css("left", x + "px");
	}
	if (pm.y == "center") {
		var y = (parseInt(that.kag.config.scHeight,10) - parseInt(tobj.outerHeight(),10))*0.5;
		tobj.css("top", y + "px");
	}
};


//■button■
tyrano.plugin.kag.tag.button.start = function(pm) {
        var that = this;

        var target_layer = null;

        //role が設定された時は自動的にfix属性になる
        if (pm.role != "") {
            pm.fix = "true";
        }

        if (pm.fix == "false") {
            target_layer = this.kag.layer.getFreeLayer();
            target_layer.css("z-index", 999999);
        } else {
            target_layer = this.kag.layer.getLayer("fix");
        }

        var storage_url = "";

        if ($.isHTTP(pm.graphic)) {
            storage_url = pm.graphic;
        } else {
            storage_url = "./data/" + pm.folder + "/" + pm.graphic
        }

        var j_button = $("<img />");
        j_button.attr("src", storage_url);
        j_button.css("position", "absolute");
        j_button.css("cursor", "pointer");
        j_button.css("z-index", 99999999);
        
        //初期状態で表示か非表示か
        if(pm.visible=="true"){
            j_button.show();
        }else{
            j_button.hide();
        }
        
/*
        if (pm.x == "") {
            j_button.css("left", this.kag.stat.locate.x + "px");
        } else {
            j_button.css("left", pm.x + "px");
        }

        if (pm.y == "") {
            j_button.css("top", this.kag.stat.locate.y + "px");
        } else {
            j_button.css("top", pm.y + "px");
        }
*/		
		if(pm.x)j_button.css("left", pm.x + "px");
		if(pm.y)j_button.css("top", pm.y + "px");
		j_button.css("top", pm.top + "px");
		j_button.css("right", pm.right + "px");
		j_button.css("bottom", pm.bottom + "px");
		j_button.css("left", pm.left + "px");
		
		//◆センタリング
		if (pm.x == "center" || pm.left=="center" || pm.right=="center") {
			var width = pm.width || 0;
			var left = (parseInt(that.kag.config.scWidth,10) - parseInt(width,10))*0.5;
			j_button.css("left", left + "px");
		}
		if (pm.y == "center" || pm.top=="center" || pm.bottom=="center") {
			var height = pm.height || 0;
			var top = (parseInt(that.kag.config.scHeight,10) - parseInt(height,10))*0.5;
			j_button.css("top", top + "px");
		}

        if (pm.fix != "false") {
            j_button.addClass("fixlayer");
        }

        if (pm.width != "") {
            j_button.css("width", pm.width + "px");
        }

        if (pm.height != "") {
            j_button.css("height", pm.height + "px");
        }

        //ツールチップの設定
        if (pm.hint != "") {
            j_button.attr({
                "title" : pm.hint,
                "alt" : pm.hint
            });
        }

        //オブジェクトにクラス名をセットします
        $.setName(j_button, pm.name);
        
        //クラスとイベントを登録する
        that.kag.event.addEventElement({
            "tag":"button",
            "j_target":j_button, //イベント登録先の
            "pm":pm
        });
        that.setEvent(j_button,pm);

        target_layer.append(j_button);

        if (pm.fix == "false") {
            target_layer.show();
        }

        this.kag.ftag.nextOrder();
}


//■image■
tyrano.plugin.kag.tag.image.start = function(pm) {

        var strage_url = "";
        var folder = "";
        var that = this;
        
        if (pm.layer != "base") {

            //visible true が指定されている場合は表示状態に持っていけ
            //これはレイヤのスタイル
            var layer_new_style = {};

            //デフォルト非表示 バックの場合も非表示ですよ。
            if (pm.visible == "true" && pm.page == "fore") {
                layer_new_style.display = "block";
            }

            this.kag.setStyles(this.kag.layer.getLayer(pm.layer, pm.page), layer_new_style);

            //ポジションの指定
            if (pm.pos != "") {

                switch(pm.pos) {

                    case "left":
                    case "l":
                        pm.left = this.kag.config["scPositionX.left"];
                        break;

                    case "left_center":
                    case "lc":
                        pm.left = this.kag.config["scPositionX.left_center"];
                        break;

                    case "center":
                    case "c":
                        pm.left = this.kag.config["scPositionX.center"];
                        break;

                    case "right_center":
                    case "rc":
                        pm.left = this.kag.config["scPositionX.right_center"];
                        break;

                    case "right":
                    case "r":
                        pm.left = this.kag.config["scPositionX.right"];
                        break;

                }

            }

            if (pm.folder != "") {
                folder = pm.folder;
            } else {
                folder = "fgimage";
            }

            //前景レイヤ
            if ($.isHTTP(pm.storage)) {
                strage_url = pm.storage;
            } else {
                strage_url = "./data/" + folder + "/" + pm.storage;
            }

            var img_obj = $("<img />");
            img_obj.attr("src", strage_url);

            img_obj.css("position", "absolute");
            img_obj.css("top", pm.top + "px");
            img_obj.css("left", pm.left + "px");
            img_obj.css("bottom", pm.bottom + "px");
            img_obj.css("right", pm.right + "px");

			//◆センタリング
			if (pm.left=="center" || pm.right=="center" || pm.x=="center") {
				var width = pm.width || 0;
				var left = (parseInt(that.kag.config.scWidth,10) - parseInt(width,10))*0.5;
				img_obj.css("left", left + "px");
			}
			if (pm.top=="center" || pm.bottom=="center" || pm.y=="center") {
				var height = pm.height || 0;
				var top = (parseInt(that.kag.config.scHeight,10) - parseInt(height,10))*0.5;
				img_obj.css("top", top + "px");
			}

            if (pm.width != "") {
                img_obj.css("width", pm.width + "px");
            }

            if (pm.height != "") {
                img_obj.css("height", pm.height + "px");
            }

            if (pm.x != "") {
                img_obj.css("left", pm.x + "px");
            }

            if (pm.y != "") {
                img_obj.css("top", pm.y + "px");
            }
            
            if(pm.zindex != ""){
                img_obj.css("z-index",pm.zindex);
            }

            //オブジェクトにクラス名をセットします
            $.setName(img_obj, pm.name);
            
            if (pm.time == 0) pm.time = ""; // integer 0 and string "0" are equal to ""
            if(pm.time != ""){
        
                img_obj.css("opacity",0);
                this.kag.layer.getLayer(pm.layer, pm.page).append(img_obj);
                
                img_obj.animate(
                    {"opacity":1},
                    parseInt(pm.time), 
                    function(){
                        if(pm.wait=="true"){
                            that.kag.ftag.nextOrder();
                        }
                    }
                );
                
                if(pm.wait !="true"){
                    that.kag.ftag.nextOrder();
                }
                        
                
            }else{
                this.kag.layer.getLayer(pm.layer, pm.page).append(img_obj);
                this.kag.ftag.nextOrder();

            }

        } else {

            //base レイヤの場合

            if (pm.folder != "") {
                folder = pm.folder;
            } else {
                folder = "bgimage";
            }

            //背景レイヤ
            if ($.isHTTP(pm.storage)) {
                strage_url = pm.storage;
            } else {
                strage_url = "./data/" + folder + "/" + pm.storage;
            }

            //backの場合はスタイルなしですよ

            var new_style = {
                "background-image" : "url(" + strage_url + ")",
                "display" : "none"
            };

            if (pm.page === "fore") {
                new_style.display = "block"
            }

            this.kag.setStyles(this.kag.layer.getLayer(pm.layer, pm.page), new_style);
            this.kag.ftag.nextOrder();

        }

};


tyrano.plugin.kag.menu.screenFull = function() {

        if ($.isNWJS() == true) {
            var gui = require("nw.gui");
            var win = gui.Window.get();
            if (win.isFullscreen) {
                win.leaveFullscreen();
				this.kag.kag.menu.button_screenfull();
            } else {
                win.enterFullscreen();
				this.kag.kag.menu.button_screendef();
            }
            
        }else{
            
            var isFullScreen = document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement || document.fullScreenElement || false;
            var isEnableFullScreen = document.fullscreenEnabled || document.webkitFullscreenEnabled || document.mozFullScreenEnabled || document.msFullscreenEnabled || false;
            var elem = document.body;
            
            if( isEnableFullScreen ){
                    
                    if (elem.requestFullscreen) {
                        if(isFullScreen){
                            document.exitFullscreen();
							this.kag.kag.menu.button_screenfull();
                        }else{
                            elem.requestFullscreen();
							this.kag.kag.menu.button_screendef();
                        } 
                    } else if (elem.webkitRequestFullscreen) {
                        if(isFullScreen){
                            document.webkitExitFullscreen();
							this.kag.kag.menu.button_screenfull();
                        }else{
                            elem.webkitRequestFullscreen();
							this.kag.kag.menu.button_screendef();
                        }
                    } else if (elem.mozRequestFullScreen) {
                        if(isFullScreen){
                            document.mozCancelFullScreen();
							this.kag.kag.menu.button_screenfull();
                        }else{
                            elem.mozRequestFullScreen();
							this.kag.kag.menu.button_screendef();
                        }
                    } else if (elem.msRequestFullscreen) {
                        if(isFullScreen){
                            document.msExitFullscreen();
							this.kag.kag.menu.button_screenfull();
                        }else{
                            elem.msRequestFullscreen();
							this.kag.kag.menu.button_screendef();
                        }                    
                    }
            }
            
        }
        
    };
	

tyrano.plugin.kag.menu.button_screenfull = function() {
	this.kag.ftag.startTag("eval", {"exp":"sf.screenfull = 'screenfull.png'"});
	this.kag.ftag.startTag("eval", {"exp":"sf.screenfull_on = 'screenfull_on.png'"});
	this.kag.menu.button_screen_redraw();
};
tyrano.plugin.kag.menu.button_screendef = function() {
	this.kag.ftag.startTag("eval", {"exp":"sf.screenfull = 'screendef.png'"});
	this.kag.ftag.startTag("eval", {"exp":"sf.screenfull_on = 'screendef_on.png'"});
	this.kag.menu.button_screen_redraw();
};


tyrano.plugin.kag.menu.button_screen_redraw = function() {
	$(".fullscreen").remove();
	this.kag.ftag.startTag("button", {
		"fix":"=true",
		"name":"fullscreen",
		"role":"fullscreen",
		"graphic":this.kag.variable.sf.screenfull,
		"enterimg":this.kag.variable.sf.screenfull_on,
		"x":20,
		"y":546,
		"clickse":"cancel2.ogg",
		"enterse":"Accent32-1.ogg",
		"width":70
	});
};


tyrano.plugin.kag.tag.awakegame.start = function(pm) {

	var that = this;
	if (this.kag.tmp.sleep_game == null) {
		this.kag.ftag.nextOrder();
	} else {

		var sleep_data = this.kag.tmp.sleep_game;

		if (pm.variable_over == "true") {
			sleep_data.stat.f = this.kag.stat.f;
		}
		var options = {
			bgm_over : pm.bgm_over
		};
            
		if(this.kag.tmp.sleep_game_next==true){
			options["auto_next"] ="yes";
		}

		this.kag.menu.loadGameData($.extend(true, {}, sleep_data), options);
	
		this.kag.tmp.sleep_game = null;
		
		this.kag.menu.button_screen_redraw();
	
	}
}
