<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>请选择一个用户名</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.slideunlock.js"></script>
<link href="css/slide-unlock.css" rel="stylesheet">
<link href="css/reveal-it.css" rel="stylesheet">
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/reveal-it.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	font-family: '微软雅黑 Light';
}

body {
	min-height: 647px;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

#header {
	min-width: 1349px;
	width: 100%;
	height: 46px;
	position: fixed;
	top: 0;
	left: 0;
	background: url(img/lohp_streams_header_bg_v4.png);
	background-size: 1449px 46px;
	z-index: 99;
	box-shadow: 0 0 5px #ccc;
}

#header img {
	height: 32px;
	width: 32px;
	position: relative;
	top: 8px;
	left: 650px;
	float: left;
	cursor: pointer;
}

#body {
	width: 830px;
	height: 100px;
	background-color: white;
	position: relative;
	top: 160px;
	left: 320px;
}

.xuan {
	color: #2A2A2A;
	position: relative;
	top: 0px;
	left: 160px;
	font-size: 25px;
}

.fangxin {
	color: #666;
	position: relative;
	top: 20px;
	left: 160px;
	font-size: 20px;
}

#txt {
	position: relative;
	top: 40px;
	left: 160px;
	width: 380px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #ccc;
	padding: 0 10px;
	color: gray;
	font-size: 20px;
}

.check {
	position: relative;
	top: 35px;
	left: 170px;
}

.yuan {
	position: relative;
	top: 20px;
	left: 330px;
	width: 200px;
	height: 200px;
	display: none;
}
</style>
</head>

<body>
	<div id="header">
		<img src="img/index.ico" />
	</div>

	<div id="body">
		<div class="xuan">选择一个用户名</div>
		<div class="yuan">
			<img
				src="${pageContext.request.contextPath}/img/spinner-rosetta-blue-26x26.gif" />
		</div>
		<div class="yonghu">
			<div class="fangxin">请放心，用户名稍后可以更改</div>
			<div id="xiaoshiba">
				<input id="txt" type="text" placeholder="用户名" name="aite" autofocus />
				<span class="check"></span> <br>

				<div id="slider">
					<div id="slider_bg"></div>
					<span id="label">&gt;&gt;</span> <span id="labelTip">拖动滑块完成注册</span>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#txt").val("");
	$("#txt").focus();
	$("#txt").on({
		focus : function() {
			$(this).css("border", "1px solid rgba(29,141,242,1.00)");
		},
		blur : function() {
			$(this).css("border", "1px solid  #ccc");
		}
	});

	$("#header img").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid rgba(29,141,242,1.00)");

		},
		mouseout : function() {
			$(this).css("borderBottom", "");
		},
		click : function() {
			location = "index.jsp";
		}
	});

	$("#txt").bind('input propertychange change', function() {
		var txt = $("#txt").val();
		var xmlHttp = new XMLHttpRequest();

		if ($(this).val() == "") {
			$(this).css("color", "gray");
		} else {
			$(this).css("color", "black");
		}
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) { //如果等于4，说明服务器响应成功了
				//这里的代码在服务器响应成功时执行！
				if (xmlHttp.status == 200) { //如果服务器响应码是200时
					var regex = new RegExp("^[A-Za-z0-9]+$", "g");
					var data = xmlHttp.responseText;

					if (data == "yes" && txt != "" && txt != null && regex.test(txt)) {
						$(".check").html("<img src='img/icon_tick_blue.png'/>");
					} else if (data == "no" && txt != "" && txt != null && regex.test(txt)) {
						$(".check").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>该用户名已被占用。</span>");
					} else {
						$(".check").html("<img src='img/error.png'/><span style='color:tomato;font-size:14px'>只支持英文字母和数字。</span>");
					}
				}
			}
		}
		xmlHttp.open("GET", "/mytwitter/user.do?method=checkaite&aite=" + txt, false);
		xmlHttp.send(null);
	});

	$(function() {
		var slider = new SliderUnlock("#slider", {
			successLabelTip : "完成"
		}, function() {
			if ($("#txt").val() == "" || $(".check:eq(0)").html().indexOf("img/icon_tick_blue.png") < 0) {
				location.reload();
				return;
			}
			$(".yonghu").hide();
			$(".yuan").show();
			window.setInterval(function() {
				window.location.href = "user.do?method=signup&aite=" + $("#txt").val();
			}, 3000);
		});
		slider.init();
	});

	function bling() {
		$("#labelTip").stop().animate({
			'color' : "black"
		}, 5000, function() {
			$("#labelTip").css("color", "gray");
		})
	}
	;

	window.onload = function() {
		bling();
	}
	window.setInterval('bling()', 7000);
</script>
</html>
