<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${admin == null }">
	<jsp:forward page="backend.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>关于</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.countup.min.js"></script>
<script src="js/highcharts.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: "微软雅黑";
}

body {
	background-color: gainsboro;
}

#loader {
	width: 1370px;
	height: 50px;
	background-color: royalblue;
	position: fixed;
	top: 0px;
	left: 0px;
	z-index: 9;
	box-shadow: 0 0 5px gray;
}

#loadetial {
	position: absolute;
	left: 1155px;
	top: 0px;
	height: 50px;
}

#loadetial ul li {
	float: left;
	padding: 15px;
	font-size: 16px;
	cursor: pointer;
	height: 50px;
}

.down {
	font-size: 10px;
	position: relative;
	top: 0px;
	margin-left: 2px;
}

#exit {
	width: 90px;
	height: 30px;
	background-color: white;
	position: absolute;
	top: 50px;
	box-shadow: 0 0 1px gray;
	text-align: center;
	border-radius: 0 0 1px 1px;
	line-height: 30px;
	cursor: pointer;
	display: none;
}

#cebian {
	height: 100%;
	width: 150px;
	position: fixed;
	top: 50px;
	left: 0px;
	background-color: #293038;
	z-index: 8;
	box-shadow: 0 0 1px whitesmoke;
}

#body {
	margin-top: 150px;
	margin-left: 150px;
	width: 1180px;
	height: 460px;
}

.daohangdai {
	height: 30px;
	width: 100%;
	background-color: darkslategray;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
	background-color: #394555;
	color: white;
}

#list {
	width: 100%;
	height: 300px;
	color: white;
}

#list ul li {
	width: 100%;
	height: 20px;
	font-size: 14px;
	padding: 10px 20px 30px 20px;
	line-height: 20px;
	cursor: pointer;
}

li {
	list-style: none;
}

.glyphicon-user {
	font-size: 14px;
}

.tubiao {
	padding-right: 20px;
}

#logo {
	width: 30px;
	height: 30px;
	margin-top: 10px;
	margin-left: 680px;
	cursor: pointer;
}

.counter {
	color: white;
	margin-left: -20px;
}

#color {
	width: 75px;
	height: 120px;
	background-color: white;
	position: absolute;
	top: 50px;
	left: 90px;
	box-shadow: 0 0 1px gray;
	display: none;
}

.colornext {
	width: 75px;
	height: 30px;
	font-size: 14px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}
</style>

</head>

<body>
	<div id="loader">
		<div id="logo">
			<img src="img/index.ico" style="width: 24px;height: 24px;margin: 5px" />
		</div>
		<div id="loadetial">
			<ul>
				<li>${admin.aname }<span
					class="glyphicon glyphicon-chevron-down down"></span></li>
				<li>换肤<span class="glyphicon glyphicon-chevron-down down"></span></li>
			</ul>
			<div id="exit">退出</div>
			<div id="color">
				<div class="colornext" style="background-color: orange;">橙色</div>
				<div class="colornext" style="background-color:royalblue">蓝色</div>
				<div class="colornext" style="background-color: green">绿色</div>
				<div class="colornext" style="background-color:pink">粉色</div>

			</div>
		</div>
	</div>
	<div id="cebian">
		<div class="daohangdai" id="big">
			<span class="glyphicon glyphicon-menu-hamburger"
				style="margin-top: 8px"></span>
		</div>
		<div id='list'>
			<ul>
				<li><span class="glyphicon glyphicon-home tubiao"></span><span
					class="zi">主页</span></li>
				<li><span class="glyphicon glyphicon-user tubiao"></span><span
					class="zi">用户中心</span></li>
				<li><span class="glyphicon glyphicon-list-alt tubiao"></span><span
					class="zi">推文中心</span></li>
				<li><span class="glyphicon glyphicon-heart tubiao"></span><span
					class="zi">关于</span></li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div
			style="font-size: 35px;color:#ccc;text-align: center;width: 1100px;line-height: 140px;">
			To Be or Not To Be,<br> It Is A Question.
		</div>
	</div>
</body>
<script>
	var color = "royalblue";
	$("#big").on({
		click : function() {
			var width = $("#cebian").css("width");
			if (width == '150px') {
				$("#cebian").css("width", "60px");
				$("#body").css("marginLeft", "60px");
				$(".zi").css("display", "none");
			} else {
				$("#cebian").css("width", "150px");
				$("#body").css("marginLeft", "150px");
				$(".zi").css("display", "");
			}

		}
	});
	$("#list ul li:eq(0)").click(function() {
		location = 'page.jsp';
	});
	$("#list ul li:eq(1)").click(function() {
		location = 'admin.do?method=getinfo';
	});
	$("#list ul li:eq(2)").click(function() {
		location = 'admin.do?method=gettweet';
	});
	$("#list ul li:eq(3)").click(function() {
		location = 'about.jsp';
	});
	$("#list ul li:eq(3)").css("background", color);
	$("#list ul li").on({
		mouseover : function() {
			$(this).css("background", "gray");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#list ul li:eq(3)").css("background", color);
		}
	});

	$("#loadetial ul li").on({
		mouseover : function() {
			$(this).css("background", "white");
		},
		mouseout : function() {
			$(this).css("background", "");
		}
	});

	$("#loadetial ul li:eq(0)").on({
		mouseover : function() {
			$("#exit").show();
		},
		mouseout : function() {
			$("#exit").hover(function() {
				$(this).show();
			},
				function() {
					$(this).hide();
				});
			$("#exit").hide();
		}
	});

	$("#exit").on({
		mouseover : function() {
			$(this).css("background", "#ea6f5a");
			$(this).css("color", "white");
			$("#loadetial ul li:eq(3)").css("background", "white");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#loadetial ul li:eq(0)").css("background", "");
			$(this).css("color", "black");
			$(this).hide();
		},
		click : function() {
			location = "admin.do?method=exit";
		}
	});
	$("#loadetial ul li:eq(1)").on({
		mouseover : function() {
			$(this).css("background", "white");
			$("#color").show();
		},
		mouseout : function() {
			$("#color").hover(function() {
				$("#loadetial ul li:eq(1)").css("background", "white");
				$(this).show();
			},
				function() {
					$("#loadetial ul li:eq(1)").css("background", "");
					$(this).hide();
				});
			$(this).css("background", "");
			$("#color").hide();
		}
	});
	$(".colornext").on({
		mouseover : function() {
			$(this).css("color", "white");
		},
		mouseout : function() {
			$(this).css("color", "black");
		},
		click : function() {
			color = $(this).css("backgroundColor");
			$("#loader").css("backgroundColor", color);
			$("#list ul li:eq(0)").css("background", color);
			$("#list ul li").on({
				mouseover : function() {
					$(this).css("background", "gray");
				},
				mouseout : function() {
					$(this).css("background", "");
					$("#list ul li:eq(3)").css("background", color);
				}
			});
		}
	});
</script>

</html>

