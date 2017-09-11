<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${admin == null }">
	<jsp:forward page="backend.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>用户中心</title>
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
	margin-top: 50px;
	margin-left: 150px;
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

#bugaoban {
	width: 1180px;
	height: 470px;
	background-color: white;
	position: relative;
	top: 40px;
	left: 20px;
	padding-top: 5px;
	float: left;
	margin-bottom: 40px;
	border-radius: 5px;
}

.userinfo {
	width: 520px;
	height: 50px;
	border: 1px dotted  gray;
	margin-top: 5px;
	margin-left: 50px;
	cursor: pointer;
	border-radius: 3px;
	float: left;
	z-index: 1;
}

.touxiang {
	height: 40px;
	width: 40px;
	margin-top: 5px;
	margin-left: 25px;
	border-radius: 25px;
	float: left;
}

.mingzi {
	height: 50px;
	line-height: 50px;
	margin-left: 10px;
	font-size: 16px;
	font-weight: bold;
	min-width: 60px;
	max-width: 60px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: auto;
	float: left;
}

.aite {
	min-width: 60px;
	height: 50px;
	line-height: 50px;
	width: 60px;
	max-width: 60px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
	height: 50px;
}

.time {
	height: 50px;
	line-height: 50px;
	margin-left: 5px;
	float: left;
}

.btn-info {
	margin-left: 15px;
	margin-top: 6.5px;
}

#banban1 {
	width: 1180px;
	float: left;
}

.tingfeng {
	margin-top: 7px;
	margin-left: 10px;
}

.jiefeng {
	margin-top: 7px;
	margin-left: 10px;
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
					class="glyphicon glyphicon-chevron-down down"></span>
				</li>
				<li>换肤<span class="glyphicon glyphicon-chevron-down down"></span>
				</li>
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
		<div>
			<input id="cn" type="text"
				style="position:relative;left:20px;top:40px; float:left;padding: 2px;border-radius: 3px;border:1px solid grey; "
				placeholder="输入搜索内容..." /> <input class="btn btn-info"
				style="position:relative;left:10px;top:30px;height: 28px ;line-height: 14px"
				id="cncncn" type="button" value="搜索" onclick="soucncn()" /> <input
				class="btn btn-info" type="button" onclick="sort()"
				style="position:relative;left:807px;top:30px; width: 150px"
				id="paixu" value="按最近登录时间排序" />
		</div>
		<div id="bugaoban">
			<div id="banban1">
				<c:if test="${ empty map.list}">
					<div
						style="text-align: center;line-height: 400px;font-size: 35px;color:#ddd;">没有相关用户！</div>
				</c:if>
				<c:if test="${!empty map.list }">
					<c:forEach items="${map.list }" var="user">
						<div class="userinfo">
							<img class="touxiang" style="float: left"
								src="${pageContext.request.contextPath}/img/${user.uname }/${user.ulogo}" />
							<div class="mingzi">${user.urealname }</div>
							<div class="aite" class="max-width: 60px">@${user.uaite }</div>
							<c:if test="${user.lastTime != null }">
								<div class="time">
									最近登录时间：
									<fmt:formatDate value="${user.lastTime }"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</c:if>
							<c:if test="${user.lastTime == null }">
								<div class="time">
									最近登录时间：
									<fmt:formatDate value="${user.utime }"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</c:if>
							<input type="hidden" value="${user.uid }" />
							<c:if test="${user.ustate == 1 }">
								<button class="btn btn-danger tingfeng" style="z-index:10">停封</button>
							</c:if>
							<c:if test="${user.ustate == 0 }">
								<button class="btn btn-info jiefeng" style="z-index:10">解封</button>
							</c:if>

						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div id="fenye"
			style="width:1190px;text-align: center;position: absoult;bottom: 30px">
			<ul class="pagination">
				<c:if test="${map.page<=6 }" var="f">
					<c:forEach begin="1"
						end="${map.pageCount>10 ? 10 : map.pageCount }" var="i">
						<c:if test="${map.page==i }">
							<li><a href="#">${i }</a></li>
						</c:if>
						<c:if test="${map.page!=i }">
							<li><a href="#">${i }</a></li>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${not f }">
					<c:forEach begin="${map.page-5 }"
						end="${map.page+4 > map.pageCount ? map.pageCount : map.page+4 }"
						var="i">
						<c:if test="${map.page==i }">${i }</c:if>

						<c:if test="${map.page!=i }">
							<li><a href="#">${i }</a></li>
						</c:if>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<script>
	$(".tingfeng").click(function(){
		var uid = $(this).prev().val();
		location="admin.do?method=updatestate&state=ting&uid="+uid;
	})
	$(".jiefeng").click(function(){
		var uid = $(this).prev().val();
		location="admin.do?method=updatestate&state=jie&uid="+uid;
	})
	var page;
	if (isNaN(${param.page})) {
		page = 1;
	} else {
			page = "${param.page}";
	}
	$(".pagination li:eq("+(page-1)+")").attr("class", "active");
	
	function soucncn(){
		var cn = $("#cn").val().trim();
		if(cn != null && cn != ""){
			location = "admin.do?method=getinfo&cn="+cn;
		}
		if(${param.cn != null}){
			location = "admin.do?method=getinfo";
		}
	}
	
	$(".pagination li").on({
		click : function() {
			$(this).attr("class", "active");
			$(this).siblings().removeClass("active");
			page = $(this).find("a").html();
			if(page == 1){
				if(${param.cn != null}){
					location = "admin.do?method=getinfo&cn=${param.cn}";
					return;
				}
				location = "admin.do?method=getinfo";
				return;
			}
			if(${param.cn == null}){
				location = "admin.do?method=getinfo&page=" + page;
				return;
			}
			location = "admin.do?method=getinfo&page=" + page + "&cn=${param.cn}";
		}
	});
	dianji = 0;
	$(".tingfeng").on({
		click:function(){
		}
	})
	$(".userinfo").on({
		mouseover : function() {
			$(this).css("backgroundColor", "#ddd");
			$(this).css("border", "1px solid gray");
			
		},
		mouseout : function() {
			$(this).css("backgroundColor", "");
				$(this).css("border", "1px dotted gray");
		}
	});
	$(".mingzi, .aite, .time, .touxiang").on({
		click:function(){
			location = "admin.do?method=gettweet&cn=" + $(this).parent().find(".mingzi").html().trim();
		}
	})
	function sort() {
			var divTestJQ = $("#banban1"); //取得容器对象
			var divJQ = $(">div.userinfo", divTestJQ); //取容器需要重排的对象
			var EntityList = []; //定义一个数组用于存放要排序的对象
			divJQ.each(function() {
				var thisJQ = $(this);
				EntityList.push({
					Name: thisJQ.find(".time").html().trim(),
					JQ: thisJQ
				}); //把要排序的对象和排序的值一起放到一个新的对象里，并存入到数组

			});

			EntityList.sort(function(a, b) { //利用数组的排序方法重新排序对象
				return b.Name > a.Name; //从大到小
				//return a.Name - b.Name; //从小到大
			});

			for(var i = 0; i < EntityList.length; i++) {
				EntityList[i].JQ.appendTo(divTestJQ); //把排序完的对象重新插入到容器对象
			};
		}
</script>
<script>

	var color = "royalblue";
	$("#big").on({
		click : function() {
			var width = $("#cebian").css("width");
			if (width == '150px') {
				$("#cebian").css("width", "60px");
				$("#body").css("marginLeft", "60px");
				$(".zi").css("display", "none");
				$("#bugaoban").css("width", "1270px");
				$("#banban1").css("width", "1270px");
				$(".userinfo").css("width", "560px");
				$(".touxiang").css("marginLeft", "45px");
				$(".time").css("marginLeft", "15px");
				$("#paixu").css("left", "897px");
			} else {
				$("#cebian").css("width", "150px");
				$("#body").css("marginLeft", "150px");
				$(".zi").css("display", "");
				$("#bugaoban").css("width", "1180px");
				$("#banban1").css("width", "1180px");
				$(".userinfo").css("width", "520px");
				$(".touxiang").css("marginLeft", "25px");
				$(".time").css("marginLeft", "5px");
				$("#paixu").css("left", "807px");
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
	$("#list ul li:eq(1)").css("background", color);
	$("#list ul li").on({
		mouseover : function() {
			$(this).css("background", "grey");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#list ul li:eq(1)").css("background", color);
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
			$(this).css("background", "#ea6f5a ");
			$("#loadetial ul li:eq(0)").css("background", "white");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#loadetial ul li:eq(0)").css("background", "");
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
			$("#list ul li:eq(1)").css("background", color);
			$("#list ul li").on({
				mouseover : function() {
					$(this).css("background", "gray");
				},
				mouseout : function() {
					$(this).css("background", "");
					$("#list ul li:eq(1)").css("background", color);
				}
			});
		}
	});
</script>

</html>

