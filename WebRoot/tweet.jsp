<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${admin == null }">
	<jsp:forward page="backend.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>推文中心</title>
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
	<div style="margin-top: 50px;margin-left: 181px;">
		<div style="position: relative;top:35px;width: 600px;">
			<input id="cn" type="text"
				style="width: 300px;border-radius: 3px;border:1px solid grey;padding:3px"
				placeholder="输入搜索内容..." />
			<button type="button" class="btn btn-info"
				style="height: 28px;line-height: 15px;position: relative;top:-1px"
				onclick="soucncn()">搜索</button>
		</div>
		<button class="btn btn-danger" style="margin-left: 1066px">批量删除</button>
	</div>
	<div id="body">
		<div
			style="width: 1150px;min-height: 460px;height:auto;background: white;margin-bottom: 10px;margin-left: 30px;margin-top: 10px;margin-right: 50px;border-radius: 5px;padding: 10px;">
			<table class="table table-bordered  table-striped table-hover" style="width:100%">

				<c:if test="${ empty map.list}">
					<div
						style="text-align: center;line-height: 400px;font-size: 35px;color:#ddd;">没有相关内容！</div>
				</c:if>
				<c:if test="${!empty map.list }">
					<thead>
						<tr>
							<th style="width: 50px;text-align: center;">选项<input
								type="checkbox"
								style="margin-left: 4px;position:relative;top:1px" id="quanxuan" /></th>
							<th style="width: 100px;text-align: center;">用户</th>
							<th style="width: 250px;text-align: center;">内容</th>
							<th style="width: 100px;text-align: center;">时间</th>
							<th style="width: 50px;text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${map.list }" var="tweet">
							<tr class="tuiweninfo">
								<td style="width: 50px;text-align: center;"><input
									type="checkbox" name="subBox" /></td>
								<td style="width: 100px;"><img
									style="border-radius:3px;width: 38px;height: 38px;margin-left: 10px;margin-right: 10px;float: left;"
									src="${pageContext.request.contextPath}/img/${tweet.uname }/${tweet.ulogo}">
									<div>
										<div style="margin-left: 5px;font-weight: bold;">${tweet.urealname }</div>
										<div style="margin-left: 5px;font-size: 14px">@${tweet.uaite }</div>
									</div></td>
								<td style="width: 250px;max-width: 250px;word-wrap:break-word;">${tweet.tcontent }
									<c:if test="${tweet.tpic != null }">
										<a style="margin-left: 5px;" target="_blank"
											href="${pageContext.request.contextPath}/img/${tweet.uname }/${tweet.tpic}">
											图片</a>
									</c:if>
								</td>
								<td style="width: 100px;text-align: center;"><fmt:formatDate
										value="${tweet.ttime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td style="width: 50px;text-align: center;"><input
									type="hidden" value="${tweet.tid }" class="ttid" /> <input
									type="hidden" value="${tweet.uid }" class="uuid" />
									<button type="button" class="btn btn-danger deltweet">删除</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>

		</div>
		<div style="width:1199px;text-align: center;">
			<div id="fenye">
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

	</div>
</body>
<script>
	$(".deltweet").click(function(){
		var tid = $(this).prev().prev().val();
		var uid = $(this).prev().val();
		location = "admin.do?method=deltweet&tid=" + tid+"&uid=" + uid;
	});
	var page;
	if (isNaN(${param.page})) {
		page = 1;
	} else {
		page = "${param.page}";
	}
	$(".pagination li:eq("+(page-1)+")").attr("class", "active");
	$(".pagination li").on({
		click : function() {
			$(this).attr("class", "active");
			$(this).siblings().removeClass("active");
			page = $(this).find("a").html();
			if(page == 1){
				if(${param.cn != null}){
					location = "admin.do?method=gettweet&cn=${param.cn}";
					return;
				}
				location = "admin.do?method=gettweet";
				return;
			}
			if(${param.cn == null}){
				location = "admin.do?method=gettweet&page=" + page;
				return;
			}
			location = "admin.do?method=gettweet&page=" + page + "&cn=${param.cn}";
		}
	});
	$("#quanxuan").click(function() {
		if (this.checked) {
			$("input[name = 'subBox']").prop("checked", true);
		} else {
			$("input[name = 'subBox']").prop("checked", false);
		}
	});
	function soucncn(){
		var cn = $("#cn").val().trim();
		if(cn != null && cn != ""){
			location = "admin.do?method=gettweet&cn="+cn;
		}
		if(${param.cn != null}){
			location = "admin.do?method=gettweet";
		}
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
	$("#list ul li:eq(2)").css("background", color);
	$("#list ul li").on({
		mouseover : function() {
			$(this).css("background", "gray");
		},
		mouseout : function() {
			$(this).css("background", "");
			$("#list ul li:eq(2)").css("background", color);
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
			$("#list ul li:eq(2)").css("background", color);
			$("#list ul li").on({
				mouseover : function() {
					$(this).css("background", "gray");
				},
				mouseout : function() {
					$(this).css("background", "");
					$("#list ul li:eq(2)").css("background", color);
				}
			});
		}
	});
</script>

</html>

