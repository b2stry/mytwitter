<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="icon" href="img/index.ico" />
<script src="js/jquery-3.1.1.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: '微软雅黑 Light';
}

.hidden {
	display: none;
}

body {
	background-color: rgba(245, 248, 250, 1.00);
}

#loader {
	min-width: 1349px;
	background-color: rgba(255, 255, 255, 1.00);
	width: 100%;
	height: 46px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 9;
	box-shadow: 0 0 5px #ccc;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

.zhuye {
	background-color: rgba(255, 255, 255, 1.00);
	height: 46px;
	width: 200px;
	float: left;
	margin-left: 80px;
}

.zhuye li {
	background-color: rgba(255, 255, 255, 1.00);
	float: left;
	font-size: 14px;
	height: 43px;
	line-height: 40px;
	text-align: center;
	padding: 0 15px;
	cursor: pointer;
	position: relative;
	left: 160px;
}

.zhuye li a {
	background-color: rgba(255, 255, 255, 1.00);
	height: 46px;
	line-height: 46px;
	color: gray;
}

.zhuye li img {
	background-color: rgba(255, 255, 255, 1.00);
	height: 20px;
	width: 20px;
	margin-right: 5px;
	position: relative;
	top: 5px;
}

#body {
	width: 830px;
	height: 350px;
	background-color: white;
	position: relative;
	top: 60px;
	left: 260px;
	box-shadow: 0 0 5px #ccc;
	border-radius: 5px;
}

#shang {
	width: 830px;
	height: 250px;
	background-color: white;
	border-radius: 5px 5px 0 0;
}

#xia {
	width: 830px;
	height: 100px;
	background-color: gainsboro;
	border-radius: 0 0 5px 5px;
}

#biao {
	width: 400px;
	height: 210px;
	position: relative;
	left: 200px;
	top: 25px;
}

.txt {
	width: 290px;
	height: 30px;
	border: 1px solid gray;
	padding: 0 5px;
	border-radius: 5px;
	margin: 10px 50px;
	color: gary;
	font-size: 15px;
}

#btn {
	background-color: rgba(29, 161, 241, 1.00);
	padding: 10px 130px;
	border-radius: 5px;
	border: 1px solid rgb(26, 117, 152);
	border-image: none;
	color: rgb(255, 255, 255);
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	margin: 10px 50px;
}

.deng {
	width: 400px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#xia div {
	position: relative;
	left: 250px;
	top: 40px;
	color: gray;
	font-size: 13px;
}

#zhuce {
	color: dodgerblue;
	cursor: pointer;
}

#tixing {
	width: 550px;
	height: 60px;
	background-color: white;
	position: fixed;
	top: 46px;
	left: 400px;
	z-index: 8;
	border-radius: 5px;
	box-shadow: 0 0 2px gray;
}

.tishiyu {
	color: gray;
	position: relative;
	top: 20px;
	left: 85px;
	font-size: 13px;
}

.cha {
	color: gray;
	position: relative;
	left: 170px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="loader">
		<div>
			<ul class="zhuye">
				<li><img src="img/index.ico"><a href="index.jsp"><b>主页</b></a></li>
			</ul>
		</div>
	</div>

	<c:if test="${display == 'show' }">
		<div id="tixing">
			<span class="tishiyu">您的用户名和密码与我们的记录不匹配，请重新检查后重试。</span><span
				class="cha">&times;</span>
		</div>
	</c:if>
	<c:if test="${display == 'stop' }">
		<div id="tixing">
			<span class="tishiyu">该用户已冻结！如需继续使用服务，请前往xxxx.twitter.com申请解封。</span><span
				class="cha">&times;</span>
		</div>
	</c:if>

	<div id="body">
		<div id="shang">
			<div id="biao">
				<div class="deng">登录 Twitter</div>
				<form action="user.do?method=checklogin" method="post">
					<input class="txt" type="text" placeholder="邮件地址或用户名"
						style="margin-top: 20px" autofocus name="username" /><br> <input
						class="txt" type="password" placeholder="密码"
						style="margin-bottom: 20px" name="password" /><br> <input
						id="btn" type="submit" value="登录" /><br>
				</form>
			</div>
		</div>
		<div id="xia">

			<div>
				首次使用 Twitter?<span id="zhuce"> 现在注册 »</span>
			</div>
		</div>
	</div>
</body>
<script>
	$(".txt").val("");
	$(".txt").on({
		focus : function() {
			$(this).css("border", "1px solid rgba(29,141,242,1.00)");
		},
		blur : function() {
			$(this).css("border", "1px solid gray");
		}
	});

	$(".zhuye li").on({
		mouseover : function() {
			$(this).css("borderBottom", "3px solid rgba(29,161,241,1.00)");
		},

		mouseout : function() {
			$(this).css("borderBottom", "");
		}
	});

	$("#zhuce").on({
		mouseover : function() {
			$(this).css("borderBottom", "1px solid rgba(29,161,241,1.00)");
		},
		mouseout : function() {
			$(this).css("borderBottom", "");
		},
		click : function() {
			location = "register.jsp";
		}
	});

	$(".cha").on({
		mouseover : function() {
			$(this).css("color", "black");
		},
		mouseout : function() {
			$(this).css("color", "gray");
		},
		click : function() {
			$("#tixing").fadeOut();
		}
	});

	$("#btn").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
		}
	});
</script>
</html>
