<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Twitter / 开始</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: "microsoft yahei";
}

body {
	width: 1349px;
	min-height: 630px;
	background-color: rgba(230, 236, 240, 1.00);
	height: auto;
	font-family: "microsoft yahei";
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
	background-size: 1349px 46px;
	z-index: 99;
	border-bottom: 1px solid gainsboro;
	background-color: white;
}

#header img {
	height: 25px;
	width: 26px;
	position: relative;
	top: 12px;
	left: 650px;
	float: left;
	cursor: pointer;
}

#first {
	width: 500px;
	height: auto;
	float: left;
	margin-left: 70px;
}

#second {
	width: 500px;
	height: auto;
	margin-left: 490px;
}

#second ul li {
	margin-top: 20px;
	display: none;
}

#second ul li img {
	border-radius: 5px;
}

#body {
	margin-top: 60px;
	float: left;
}

#bodytwo {
	width: 1050px;
	height: 700px;
	background-color: white;
	margin-left: 150px;
	border-radius: 5px;
}

.yuan {
	width: 97%;
	text-align: center;
	display: none;
}

.yuan img {
	margin-top: 180px;
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<div id="header">
		<img src="img/index.ico" />
	</div>
	<div id="body">
		<div id="bodytwo">
			<div class="yuan">
				<img src="${pageContext.request.contextPath}/img/5-121204193Q8.gif" />
				<div style="margin-left: 10px;color:#333">正在为您配置账号，请稍等片刻。</div>
			</div>
			<div id="first">
				<div
					style="width: 400px;font-size: 28px;margin-top: 80px;font-weight: bold;color: black;">很高兴你来到这里，${user.urealname }。</div>
				<div
					style="width: 400px;font-size: 21px;margin-top: 30px;font-weight: bold;color: dimgray;">Twitter将持续更新最潮、最重大的新闻、媒体、体育、电视、对话消息等等——全为你量身定制！</div>
				<div
					style="width: 400px;font-size: 21px;margin-top: 20px;font-weight: bold;color: dimgray;">告诉我们你喜欢的东西，我们会帮你打点一切。</div>
				<button id="btn"
					style="border: none; margin-top: 20px;padding: 15px 30px;text-align: center;border-radius: 50px;color: white;font-size: 20px; font-weight: bold;background-color: rgb(19, 163, 243);cursor: pointer;">
					<p style="margin-left:5px">我们开始吧！</p>
				</button>
			</div>
			<div id="second">
				<ul>
					<li style="margin-left: 100px;padding-top:20px"><img
						src="img/na_1.jpg" /></li>
					<li style="position: relative;left: -70px;"><img
						src="img/na_2.jpg" /></li>
					<li style="margin-left: 100px;"><img src="img/na_3.jpg" /></li>
					<li style="margin-bottom: 50px;"><img src="img/na_4.jpg" /></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script>
	$("#btn").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", "rgb(29, 161, 243)");
		},
		click : function() {
			$("#first").hide();
			$("#second").hide();
			$(".yuan").show();
			window.setInterval(function() {
				window.location.href = "signin.do?method=online";
			}, 3000)
		}
	});
	$("#second ul li:eq(0)").fadeIn(500, function() {
		$("#second ul li:eq(1)").fadeIn(500, function() {
			$("#second ul li:eq(2)").fadeIn(500, function() {
				$("#second ul li:eq(3)").fadeIn();
			});
		});
	});
</script>
< /html>