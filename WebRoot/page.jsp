<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${admin == null }">
	<jsp:forward page="backend.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>后台主界面</title>
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
	box-shadow: 0 0 5px #657786;
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

.kapian {
	width: 265px;
	height: 130px;
	background-color: whitesmoke;
	margin-left: 30px;
	margin-top: 70px;
	box-shadow: 0 0 .5px #657786;
	float: left;
	cursor: pointer;
}

#body {
	margin-top: 50px;
	margin-left: 150px;
}

#welcome {
	margin-left: 30px;
	margin-top: 90px;
}

#username {
	color: black;
	font-size: 28px;
	font-weight: bold;
}

#huanying {
	font-size: 17px;
}

#time {
	width: 260px;
	height: 80px;
	position: absolute;
	top: 95px;
	left: 1070px;
	box-shadow: 0 0 0.5px #657786;
}

#date {
	width: 140px;
	height: 80px;
	background-color: royalblue;
	float: left;
	color: white;
}

#xingqi {
	margin-top: 15px;
	margin-left: 10px;
}

#riqi {
	margin-left: 10px;
}

#hour {
	width: 120px;
	height: 80px;
	background-color: white;
	position: absolute;
	right: 0px;
	color: dodgerblue;
	text-align: center;
	line-height: 80px;
}

#hourtime {
	color: royalblue;
	font-size: 27px;
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

#detail {
	width: 1200px;
	height: 130px;
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

#message {
	width: 1150px;
	height: 250px;
	position: absolute;
	top: 380px;
	left: 180px;
	border-radius: 5px;
	text-align: center;
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
					class="glyphicon glyphicon-chevron-down down"></li>
				<li>换肤<span class="glyphicon glyphicon-chevron-down down"></li>
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
		<div id="welcome">
			<div id="username">您好，</div>
			<div id="huanying">欢迎登录推特后台 !</div>
		</div>

		<div id="time">
			<div id="date">
				<div id="xingqi"></div>
				<div id="riqi">
					<span id="year" style="font-size: 23px;"></span><span id="month"></span>
				</div>
			</div>
			<div id="hour">
				<div id="hourtime">
					<span id="hours"></span>:<span id="min"></span>
				</div>
			</div>
		</div>

		<div id="detail">
			<div class="kapian" style="background: dodgerblue">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;width: 100%;height: 30px;font-weight: bold">在线人数：</div>
				</div>
				<span class="glyphicon glyphicon-eye-open"
					style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px">
				<span class="counter" style="font-size: 35px;">0</span>
			</div>
			<div class="kapian" style="background: #ea6f5a">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold ">今日访问量：</div>
				</div>
				<span class="glyphicon glyphicon-plus"
					style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px">
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
			<div class="kapian" style="background: mediumpurple ">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold">推文数：</div>
				</div>
				<span class="glyphicon glyphicon-refresh "
					style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px">
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
			<div class="kapian" style="background: coral">
				<div
					style="width: 100%;height: 40px;background-color: white;margin-top: -10px;line-height: 40px">
					<div
						style="font-size: 20px;color: black;margin: 10px 0 20px 10px;font-weight: bold">总人数：</div>
				</div>
				<span class="glyphicon glyphicon-user"
					style="font-size: 30px; color: white;margin-left: 30px;margin-top: 20px">
				<span class="counter" style="font-size: 35px;"><fmt:formatNumber
						value="0" pattern="###,###" /></span>
			</div>
		</div>
		<div id="message"></div>
	</div>
</body>
<script>
	var onlineNum = 0;
	$(function() {
		$(document).ready(function() {
			Highcharts.setOptions({
				global : {
					useUTC : false
				}
			});

			var chart;
			$('#message').highcharts({
				chart : {
					type : 'spline',
					animation : Highcharts.svg, // don't animate in old IE               
					marginRight : 10,
					events : {
						load : function() {

							// set up the updating of the chart each second             
							var series = this.series[0];
							setInterval(function() {
								var x = (new Date()).getTime(), // current time         
									y = onlineNum * 1;
								series.addPoint([ x, y ], true, true);
							}, 1000);
						}
					}
				},
				title : {
					text : '实时在线人数'
				},
				xAxis : {
					type : 'datetime',
					tickPixelInterval : 100
				},
				yAxis : {
					title : {
						text : '在线人数'
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>' +
							Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
							Highcharts.numberFormat(this.y, 2);
					}
				},
				legend : {
					enabled : false
				},
				exporting : {
					enabled : false
				},
				series : [ {
					name : '即时在线人数',
					data : (function() {
						// generate an array of random data                             
						var data = [],
							time = (new Date()).getTime(),
							i;

						for (i = -19; i <= 0; i++) {
							data.push({
								x : time + i * 1000,
								y : onlineNum * 1
							});
						}
						return data;
					})()
				} ]
			});
		});

	});
	function catnum() {
		$.ajax({
			url : '/mytwitter/admin.do?method=catnum',
			type : 'POST',
			success : function(response, status) {
				var str = response.split("-");
				$(".counter:eq(0)").html(str[0]);
				$(".counter:eq(1)").html(str[3]);
				$(".counter:eq(2)").html(str[1]);
				$(".counter:eq(3)").html(str[2]);
				onlineNum = str[0];
			}
		});
	}
	$(function() {
		catnum();
	})
	window.setInterval(function() {
		catnum();
	}, 2000);
</script>
<script>
	var color = "royalblue";
	$('.counter').countUp("1000");

	$("#big").on({
		click : function() {
			var width = $("#cebian").css("width");
			if (width == '150px') {
				$("#cebian").css("width", "60px");
				$("#body").css("marginLeft", "60px");
				$(".kapian").css("width", "287.5px");
				$(".zi").css("display", "none");
				$("#message").css("left", "130px");
				$("#detail").css("width", "1300px");
			} else {
				$("#cebian").css("width", "150px");
				$("#body").css("marginLeft", "150px");
				$(".kapian").css("width", "265px");
				$(".zi").css("display", "");
				$("#message").css("left", "180px");
				$("#detail").css("width", "1200px");
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
	$("#list ul li:eq(0)").css("background", color);
	$("#list ul li").on({
		mouseover : function() {
			$(this).css("background", "gray");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#list ul li:eq(0)").css("background", color);
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
			$("#loadetial ul li:eq(0)").css("background", "white");
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
					$("#list ul li:eq(0)").css("background", color);
				}
			});
		}
	});
	function getTime() {
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();
		var min = date.getMinutes();
		if (min < 10)
			min = "0" + min;
		var second = date.getSeconds();
		if (second < 10)
			second = "0" + second;
		var weekday = new Array(7)
		weekday[0] = "星期日"
		weekday[1] = "星期一"
		weekday[2] = "星期二"
		weekday[3] = "星期三"
		weekday[4] = "星期四"
		weekday[5] = "星期五"
		weekday[6] = "星期六"
		var week = weekday[date.getDay()];

		$("#xingqi").html(week);
		$("#year").html(year);
		$("#month").html("年" + month + "月" + day + "日");
		$("#hours").html(hour);
		$("#min").html(min + ":" + second);

		if (hour >= 5 && hour < 12)
			$("#username").html("上午好，");

		if (hour >= 12 && hour < 14)
			$("#username").html("中午好，");

		if (hour >= 14 && hour < 19)
			$("#username").html("下午好，");

		if (hour >= 19 || hour < 5)
			$("#username").html("晚上好，");
	}
	window.onload = function() {
		getTime();
	}
	window.setInterval("getTime()", 1000);

	$(".kapian").on({
		mouseover : function() {
			$(this).css("boxShadow", "0 0 5px #657786");
		},
		mouseout : function() {
			$(this).css("boxShadow", "0 0 .5px #657786");
		}
	});
</script>

</html>

