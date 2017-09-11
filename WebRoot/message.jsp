<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>推特聊天网页版</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css" />
<script src="js/jquery.mCustomScrollbar.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	background-image: url("img/body_bg.jpg");
	background-size: 105% 100%;
	text-align: center;
	width: 100%;
	height: 100%;
}

#message {
	width: 70%;
	height: 100%;
	min-height: 400px;
	min-width: 800px;
	margin: 0px auto;
	border-radius: 5px;
}

#liebiao {
	background-color: rgba(51, 53, 46, 1.00);
	height: 100%;
	width: 290px;
	min-height: 400px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	float: left;
	min-height: 400px;
}

#xiaoxi {
	background-color: rgb(238, 238, 238);
	height: 100%;
	width: 70%;
	min-height: 400px;
	margin-left: 30%;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#info {
	background-color: rgba(41, 43, 46, 1.00);
	border-top-left-radius: 5px;
	height: 70px;
	width: 100%;
}

#touxiang {
	width: 54px;
	height: 54px;
	margin-left: 20px;
	float: left;
}

#touxiang img {
	width: 54px;
	height: 54px;
	border-radius: 25px;
	margin-top: 8px;
}

#uname {
	max-width: 120px;
	width: auto;
	height: 25px;
	color: white;
	position: relative;
	top: 25px;
	left: 10px;
	font-size: 16px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left;
}

#search {
	height: 40px;
}

#search input {
	width: 100%;
	height: 40px;
	background-color: rgba(51, 53, 58, 1.00);
	border: 0px solid white;
	color: white;
	border-bottom: 0.01px solid darkgrey;
	padding-left: 35px;
	position: relative;
	top: -40px;
}

.xiangqing {
	width: 100%;
	height: 80px;
	background-color: rgba(51, 53, 58, 1.00);
	cursor: pointer;
	margin-bottom: 1px;
	color: white;
	border-left: 3px solid rgba(51, 53, 58, 1.00);
}

#friend {
	width: 100%;
	max-height: 83%;
	OVERFLOW-Y: -webkit-paged-x;
	OVERFLOW-X: hidden;
}

.touxiang {
	width: 54px;
	height: 54px;
	margin-left: 20px;
	float: left;
}

.touxiang img {
	width: 54px;
	height: 54px;
	border-radius: 25px;
	margin-top: 10px;
}

.liaotianxinxi {
	width: 70%;
	margin-left: 80px;
	text-align: left;
	padding-top: 15px;
	padding-left: 10px;
}

.liaotianname {
	font-size: 16px;
	margin-bottom: 5px;
	overflow: hidden;
	width: 70%;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
}

.liaotianneirong {
	font-size: 13px;
	color: #ccc;
	width: 80%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
}

.newmsg {
	width: 10px;
	height: 10px;
	border-radius: 25px;
	background-color: orangered;
	position: relative;
	top: 15px;
	left: 160px;
}

.liaotiantime {
	font-size: 12px;
	color: #ccc;
	position: relative;
	right: -15px;
}

#xiaoxitop {
	width: 94%;
	margin-left: 3%;
	height: 50px;
	line-height: 50px;
	border-bottom: 1px solid #ccc;
	color: #666;
	font-size: 18px;
	margin-bottom: 10px;
}

#xiaoxinall {
	padding-top: 20px;;
	background-color: rgb(238, 238, 238);
	min-height: 65%;
	max-height: 75%;
	height: 65%;
	width: 94%;
	margin-left: 3%;
	margin-bottom: 10px;
	overflow: auto;
}

#addpic {
	border-top: 1px solid #ccc;
	width: 100%;
	height: 20px;
	margin-bottom: 10px;
}

#xiaoxikuang {
	background-color: rgb(238, 238, 238);
	width: 94%;
	margin-left: 3%;
	height: 15%;
	text-align: left;
	overflow: auto;
	z-index: 9;
	padding: 5px;
	border: 0px;
	resize: none;
}

#tip {
	width: 100%;
	background-color: rgb(238, 238, 238);
	font-size: 12px;
	color: #666;
	text-align: right;
	padding-right: 20px;
	border-bottom-right-radius: 5px;
}

#xiaoxitwo {
	font-size: 18px;
	color: #ccc;
	padding-top: 40%;
	height: 100%;
}

#xiaoxione {
	height: 100%;
}

.getxiaoxi {
	height: auto;
	text-align: left;
	margin-right: 10px;
}

.sendxiaoxi {
	height: auto;
	width: 100%;
	text-align: right;
}

.gettouxiang {
	height: auto;
	width: 40px;
	height: 40px;
}

.gettouxiang img {
	width: 40px;
	height: 40px;
	border-radius: 25px;
}

.getneirong {
	position: relative;
	left: 45px;
	top: -38px;
	width: auto;
	background-color: white;
	max-width: 300px;
	min-height: 20px;
	padding: 10px;
	float: left;
	border-radius: 10px;
	color: black;
	text-align: left;
	line-height: 20px;
}

.sendtouxiang img {
	width: 40px;
	height: 40px;
	border-radius: 25px;
}

.sendneirong {
	position: relative;
	right: 45px;
	top: -38px;
	background-color: limegreen;
	width: auto;
	max-width: 300px;
	min-height: 20px;
	padding: 10px;
	float: right;
	border-radius: 10px;
	color: black;
	text-align: left;
	line-height: 20px;
}

#addfriend {
	font-size: 16px;
	color: grey;
	cursor: pointer;
	margin-left: 130px;
	margin-top: 5px;
}

#myModal {
	margin-top: 5%;
	margin-left: 5%;
}

.modal-body {
	max-height: 350px;
	overflow: auto;
}

.pengyou {
	width: 100%;
	height: 40px;
	line-height: 40px
}

.pengyoudanxuan {
	float: left;
	width: 50px;
}

.pengyoutouxiang {
	width: 25px;
	float: left;
	margin-top: 7px;
}

.pengyoutouxiang img {
	width: 25px;
	height: 25px;
	border-radius: 25px
}

.pengyouname {
	max-width: 100px;
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-left: 25px;
	font-weight: bold;
}

.pengyouaite {
	max-width: 100px;
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-left: 10px;
	float: left;
}

.online {
	width: 10px;
}

.popup_menu ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 12px;
	color: black;
}

.popup_menu {
	position: absolute;
	z-index: 90;
	border: 1px solid #AEAEAE;
	background-color: white;
	padding: 2px;
	width: 100px;
	border-radius: 5px;
}

.popup_menu a {
	display: block;
	color: #325B8E;
	text-indent: 12px;
	text-decoration: none;
	height: 30px;
	line-height: 30px;
	padding-right: 5px;
}

.popup_menu a:hover {
	background: #57B4E4;
	color: #fff;
	border-radius: 5px;
}

.mCSB_inside>.mCSB_container {
	margin-right: 0px;
}

.mCSB_scrollTools {
	width: 8px;
}

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 100%;
	background-color: rgba(207, 207, 207, 1);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#E5cfcfcf,
		endColorstr=#E5cfcfcf);
}

.mCSB_scrollTools .mCSB_draggerRail {
	background-color: rgba(255, 255, 255, .4);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#66ffffff,
		endColorstr=#66ffffff);
}

.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: rgba(207, 207, 207, 1);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#E5cfcfcf,
		endColorstr=#E5cfcfcf);
}

.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar,
	.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar {
	background-color: rgba(207, 207, 207, 1);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#E5cfcfcf,
		endColorstr=#E5cfcfcf);
}

.mCSB_scrollTools .mCSB_draggerRail {
	width: 0;
}

.mCSB_container.mCS_no_scrollbar_y.mCS_y_hidden {
	margin-right: 0px;
}
</style>
</head>

<body style="height: 100%;">
	<div id="message">
		<div id="liebiao">
			<div id="info">
				<div id="touxiang">
					<img
						src="${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo} " />
				</div>
				<div id="uname">${user.urealname }</div>
				<span class="glyphicon glyphicon-comment" id="addfriend"
					data-toggle="modal" data-target="#myModal"></span>
			</div>
			<div id="search">
				<span class="glyphicon glyphicon-search"
					style="padding-top:12px;z-index: 9;float:left;color:#657786;font-size: 16px;width: 40px;height: 40px;position: relative;"></span>
				<input type="text" placeholder="查找联系人">
			</div>
			<div id="friend"></div>
		</div>
		<div id="xiaoxi">
			<div id="xiaoxione" style="display: none;">
				<div id="xiaoxitop"></div>
				<input class="uid" type="hidden">
				<div id="xiaoxinall"></div>
				<div id="addpic"></div>
				<textarea id="xiaoxikuang"></textarea>
				<div id="tip">按下Enter发送消息/Ctrl+Enter换行</div>
			</div>
			<div id="xiaoxitwo">您还未选中或发起聊天，快去跟好友聊一聊吧</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">选择好友</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="guanbi">关闭</button>
					<button type="button" class="btn btn-primary" id="xuanze">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
<script>
	$("#xuanze").on({
		click:function(){
			xqnum = 0;
			$("input[name='haoyou']").each(function(){
				   if($(this).get(0).checked){
				   		var haoyou = $(this).get(0);
				   		$(".xiangqing").each(function(){
					   		if($(this).find(".uuid").val() == $(haoyou).parent().find(".uid").val()){
					   			if($("#xiaoxione").css("display") == "block"){
					   				if($("#xiaoxione").find(".uid").val() == $(this).find(".uuid").val()){
					   					
					   				}else{
					   					$(this).click();
					   				}
					   			}else{
					   				$(this).click();
					   			}
					   			$("#guanbi").click();
					   			return;
					   		}else{
					   			xqnum++;
					   		}
					 	});
					 	if(xqnum == $(".xiangqing").length){
					 		var html = '<div class="xiangqing" onclick="getMessage(this)"><div class="touxiang"><img src="'
								+$(haoyou).parent().find(".pengyoutouxiang img").attr("src")+ '" /></div><div class="liaotianxinxi">'
								+ '<input type="hidden" class="uuid" value="' + $(haoyou).parent().find(".uid").val()+ '"><div class="liaotianname">' + $(haoyou).parent().find(".pengyouname").html().trim() + '</div><div class="liaotiantime"></div>'
								+ '<div class="liaotianneirong"></div></div></div></div>';
							$("#friend").prepend(html);
							$(".xiangqing:eq(0)").click();
							$("#guanbi").click();
					   		return;
					 	}
				    }
			   });
			   $("#guanbi").click();
		}
	})
	$("#addfriend").on({
		mouseover : function() {
			$(this).css("color", "white");
		},
		mouseout : function() {
			$(this).css("color", "grey");
		},
		click:function(){
			addFriends();
		}
	});
	function getMessage(user) {
		if ($(user).css("backgroundColor") == "rgb(41, 43, 46)") {
			$(user).css("backgroundColor", "rgba(51, 53, 58, 1.00)");
			$(user).css("borderLeft", "");
			$("#xiaoxitwo").show();
			$("#xiaoxione").hide();
			$(this).find(".newmsg").hide();
			clearInterval(time);
			return;
		}
		$("#xiaoxitwo").hide();
		$("#xiaoxione").show();
		$(user).css("backgroundColor", "rgba(41, 43, 46, 1.00)");
		$(user).css("borderLeft", "3px solid orangered");
		$(user).siblings().css("backgroundColor", "rgba(51, 53, 58, 1.00)");
		$(user).siblings().css("borderLeft", "");
		$(this).find(".newmsg").hide();
		$("#xiaoxitop").html($(user).find(".liaotianname").html().trim());
		var uid = $(user).find(".uuid").val();
		$("#xiaoxione").find(".uid").val(uid);
		getMsg(uid);
		time = window.setInterval(function() {
			shuaxin()
		}, 1000);
	}
	function addFriends(){
		$.ajax({
			url : "/mytwitter/message.do?method=addfriend",
			type : "POST",
			asyn : true,
			success : function(response) {
				if(response =="[]"){
					$(".modal-body").html("无可聊天好友！");
					return;
				}
				var pengyou = $.parseJSON(response);
				var html = addPengyou(pengyou);
				$(".modal-body").html(html);
			}
		})
	}
	function addPengyou(pengyou){
		var html = '';
		for(var i = 0; i < pengyou.length; i++){
			html+='<div class="pengyou"><input type="hidden" class="uid" value="'
			+pengyou[i].uid+'"><input type="radio" name="haoyou" class="pengyoudanxuan" style="margin-top: 13px;margin-left: 30px;" /><div class="pengyoutouxiang"	><img src="'
			+'${pageContext.request.contextPath}/img/'+pengyou[i].uname+'/'+pengyou[i].ulogo+'" /></div><div class="pengyouname">'
			+pengyou[i].urealname+'</div><div class="pengyouaite">@'+pengyou[i].uaite+'</div>';
			
			html+='</div>';
		}
		return html;
	}
	function getMsg(uid) {
		$.ajax({
			url : "/mytwitter/message.do?method=msg&uid=" + uid,
			type : "POST",
			asyn : true,
			success : function(response) {
				var msg = $.parseJSON(response);
				var html = addMessage(msg);
				$("#xiaoxinall").html(html);	
				$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
			}
		})
	}
	
	function shuaxin(){
		var url =  "/mytwitter/message.do?method=shuaxin&uid=" +$("#xiaoxione").find(".uid").val() +"&mid=" +$(".xiaoxixiaoxi:last").find(".mid").val();
		$.ajax({
			url : url ,
			type : "POST",
			success : function(response) {
				if(response!="[]"){
					var msg = $.parseJSON(response);
					var html = addMessage(msg);
					$("#xiaoxinall").append(html);	
					$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
				}
			}
		})
	}
	function delliaotian(uid){
		var url =  "/mytwitter/message.do?method=del&uid="+ uid ;
		$.ajax({
			url : url ,
			type : "POST",
			success : function(response) {
			}
		})
	}
	function friendJs() {
	var kyoPopupMenu={};  
    kyoPopupMenu = (function(){  
    return {  
        sys: function (obj) {  
            $('.popup_menu').remove();  
            popupMenuApp = $('<div class="popup_menu app-menu"><ul><li><a menu="menu1">删除聊天</a></li></ul></div>')  
            .find('a').attr('href','javascript:;')  
            .end().appendTo('body');  
            //绑定事件  
            $('.app-menu a[menu="menu1"]').on('click', function (){  
            	var suid = $(obj).find(".uuid").val();
            	//delliaotian(suid)
            });  
            return popupMenuApp;  
        }  
    }})();  
    //取消右键  
    $('html').on('contextmenu', function (){return false;}).click(function(){  
        $('.popup_menu').hide();  
    });  
    //桌面点击右击  
	    $('.xiangqing').on('contextmenu',function (e){  
	        var popupmenu = kyoPopupMenu.sys(this);  
	        l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;  
	        t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;  
			popupmenu.css({left: l,top: t}).show();  
	        return false;  
	    }); 
		$(".xiangqing").on({
			mouseover : function() {
				if ($(this).css("backgroundColor") == "rgb(51, 53, 58)")
					$(this).css("backgroundColor", "rgba(41, 43, 45, 1.00)");
			},
			mouseout : function() {
				if ($(this).css("backgroundColor") == "rgb(41, 43, 45)")
					$(this).css("backgroundColor", "rgba(51, 53, 58, 1.00)");
			}
		});
	}
	
	$("#xiaoxikuang").keyup(function(e) {
		if (e.keyCode == 13 && e.ctrlKey) {
			$(this).val($(this).val() + "\n");
		} else if (e.keyCode == 13) {
			e.preventDefault();
			if ($(this).val().trim() != "") {
				addMessageAll();
			}
			
		}
	});
	$(function() {
		$("#friend").mCustomScrollbar({
			setTop : "0"
		});
		getFriend();
		window.setInterval(function() {
			getFriend()
		}, 1000);
	})
	function addMessageAll(){
		var url =  "/mytwitter/message.do?method=addmsg&uid=" +$("#xiaoxione").find(".uid").val() + "&mcontent=" +$("#xiaoxikuang").val() ;
		$.ajax({
			url : url,
			type : "POST",
			asyn:false,
			success : function(response) {
				if(response == "ok"){
					$('#xiaoxinall').scrollTop($('#xiaoxinall')[0].scrollHeight);
					$("#xiaoxikuang").val("");
				}
			}
		})
	
	}
	var message;
	function getFriend() {
		$.ajax({
			url : "/mytwitter/message.do?method=liebiao",
			type : "POST",
			asyn : true,
			success : function(response) {
				if (message != response) {
					var msg = $.parseJSON(response);
					var html = addMsg(response, msg);
					$("#friend").html(html);
					if($("#xiaoxione").css("display") == "block"){
						for(var i = 0; i < $(".xiangqing").length; i++){
							if($(".xiangqing:eq("+i+")").find(".uuid").val() == $("#xiaoxione").find(".uid").val() ){
								$(".xiangqing:eq("+i+")").css("backgroundColor","rgba(41, 43, 46, 1.00)");
								$(".xiangqing:eq("+i+")").css("borderLeft","3px  solid orangered");
							}
						}
					}
					friendJs();
				}
			}
		})
	}
	function addMessage(msg) {
		var html = "";
		for (var i = 0; i < msg.length; i++) {
			if(msg[i].fuid == ${user.uid}){
				html += '<div class="sendxiaoxi xiaoxixiaoxi" ><input type="hidden"  class="mid" value="'+msg[i].mid+'"><div class="sendtouxiang"><img src="${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo} " />'
				+'</div><div class="sendneirong">'+msg[i].mcontent+'</div><div style="clear: both;"></div></div>';
			}else{
				html+='<div class="getxiaoxi xiaoxixiaoxi"><input type="hidden" class="mid" value="'+msg[i].mid+'"><div class="gettouxiang"><img src="'
				+ '${pageContext.request.contextPath}/img/' + msg[i].uname + '/' + msg[i].ulogo + '" /></div>'
				+'<span class="getneirong">'+msg[i].mcontent+'</span><div style="clear: both;"></div>	</div>';
			}
		}
		return html;
	}
	var first = 0;
	function addMsg(response, msg) {
		first++;
		message = response;
		var html = "";
		for (var i = 0; i < msg.length; i++) {
			if(msg[i].fuid == ${user.uid}){
				html += '	<div class="xiangqing"  onclick="getMessage(this)"';
				if(i == 0 && first > 1){
					html+='style="background-color:rgba(41, 43, 46, 1.00);border-left:3px  solid orangered"';
				}
				html+='><div class="touxiang"><img src="'
					+ '${pageContext.request.contextPath}/img/' + msg[i].uname2 + '/' + msg[i].ulogo2 + '" /></div><div class="liaotianxinxi">'
					+ '<input type="hidden" class="uuid" value="' + msg[i].uid2 + '"><div class="liaotianname">' + msg[i].urealname2 + '</div>	<div class="liaotiantime">' + msg[i].time + '</div>'
					+ '<div class="liaotianneirong">' + msg[i].mcontent + '</div></div></div></div>'
			}else{
				html += '	<div class="xiangqing" onclick="getMessage(this)"><div class="touxiang"><img src="'
					+ '${pageContext.request.contextPath}/img/' + msg[i].uname + '/' + msg[i].ulogo + '" /></div><div class="liaotianxinxi">'
					+ '<input type="hidden" class="uuid" value="' + msg[i].fuid + '"><div class="liaotianname">' + msg[i].urealname + '</div>	<div class="liaotiantime">' + msg[i].time + '</div>'
					+ '<div class="liaotianneirong">' + msg[i].mcontent + '</div>';
				if(msg[i].mread == 0){
					html+='<div class="newmsg"></div>';				
				}
				html+='</div></div></div>';
			}
		}
		return html;
	}
</script>
</html>