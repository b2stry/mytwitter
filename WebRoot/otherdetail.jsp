<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${user == null }">
	<jsp:forward page="index.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>${who.urealname }(@${who.uaite })&nbsp;|&nbsp;Twitter</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/popup.js"></script>
<script src="js/autosize.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: "microsoft yahei";
}

body {
	width: 1349px;
	background-color: rgba(230, 236, 240, 1.00);
	height: auto;
	font-family: "microsoft yahei";
}

#loader {
	min-width: 1349px;
	background-color: rgba(255, 255, 255, 1.00);
	width: 100%;
	height: 46px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99;
	box-shadow: 0 0 5px #657786;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

#logo {
	background-color: rgba(255, 255, 255, 1.00);
	height: 23px;
	width: 23px;
	position: fixed;
	top: 12px;
	left: 650px;
	cursor: pointer;
}

.search {
	width: 220px;
	height: 30px;
	border: 1px solid rgba(203, 203, 203, 1.00);
	border-radius: 25px;
	background-color: rgba(245, 248, 250, 1.00);
	padding-right: 30px;
	padding-left: 15px;
	line-height: 30px;
	font-size: 12px;
}

#search {
	width: 300px;
	height: 30px;
	margin-left: 870px;
	margin-top: -45px;
}

.sea {
	width: 16px;
	height: 16px;
	cursor: pointer;
	float: left;
	position: relative;
	top: 7px;
	left: 210px;
	background-color: rgba(245, 248, 250, 1.00);
}

#daohang {
	width: 300px;
	height: 38px;
	margin-left: 80px;
	margin-top: 5px;
}

#daohang li {
	float: left;
	width: 80px;
	height: 42px;
	padding: 0 15px;
	line-height: 43px;
	cursor: pointer;
	font-size: 15px;
	color: rgba(102, 107, 117, 1.00);
}

.bian {
	margin-left: 5px;
	position: relative;
	top: -1px;
}

#touxiang {
	border-radius: 25px;
	position: absolute;
	right: 193px;
	top: 7px;
}

.button {
	position: absolute;
	right: 90px;
	top: 7px;
	width: 81px;
	height: 32px;
	border: none;
	color: white;
	border-radius: 5px;
	box-shadow: 0 1px 0 #657786;
}

.fa {
	font-size: 15px;
	position: relative;
	top: -6px;
	left: -2px;
}

.edit {
	font-size: 23px;
	position: relative;
	top: -1px;
	left: -4px;
}

#listlist {
	width: 180px;
	height: 360px;
	position: fixed;
	top: 51px;
	right: 185px;
	border-radius: 3px;
	box-shadow: 0 0 2.5px #657786;
	z-index: auto;
	background-color: white;
}

#list {
	display: none;
	width: 120px;
	height: 270px;
	z-index: auto;
}

.triangle {
	display: inline-block;
	width: 0;
	height: 0;
	line-height: 0;
}

.xia {
	border: 4px solid transparent;
	border-top-color: aliceblue;
	border-bottom-width: 0;
}

.shang {
	border: 10px solid transparent;
	border-bottom-color: white;
	border-top-width: 0;
	filter: drop-shadow(.5px -1px 1px #657786);
}

.ss {
	position: fixed;
	top: 41px;
	right: 200px;
	z-index: 6;
}

#body {
	width: 1349px;
	height: auto;
	float: left;
	position: relative;
	top: -200px;
}

#third {
	width: 240px;
	height: auto;
	position: absolute;
	left: 1000px;
}

#mask_shadow {
	display: none;
	opacity: 0;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .9);
}

#popup {
	display: none;
	opacity: 0;
	position: absolute;
	z-index: 2;
	top: 80px;
	width: 600px;
	height: auto;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

#popup .title {
	position: relative;
	width: 100%;
	height: 45px;
	background-color: white;
	cursor: move;
	border-radius: 5px 5px 0 0;
	margin-bottom: -10px;
}

#popup .title p {
	padding-left: 14px;
	line-height: 55px;
	color: gray;
	text-align: center;
	font-size: 17px;
	color: black;
	font-weight: bold;
}

#popup .title span {
	position: absolute;
	top: 12px;
	right: 20px;
	width: 30px;
	height: 30px;
	color: #000;
	opacity: .2;
	font-size: 21px;
	cursor: pointer;
	text-align: center;
	border-radius: 5px;
}

#popup .title span:hover {
	opacity: .8;
}

#popup .cont {
	width: 100%;
	height: 200px;
	border-radius: 0 0 5px 5px;
	min-height: 210px;
	background-color: rgba(232, 245, 253, 1);
}

.listd {
	padding: 4px 0 3px 20px;
	font-size: 15px;
	color: black;
	margin: 5px 0;
	cursor: pointer;
}

hr {
	margin: 5px 0;
}

#bg {
	background:
		url(${pageContext.request.contextPath}/img/${who.uname }/${who.ubg});
	width: 1349px;
	height: 300px;
	background-size: 1349px 300px;
	background-color: ${info.ucolor
}

;
}
#back {
	width: 620px;
	height: 60px;
	display: none;
	background-color: white;
	cursor: pointer;
}

#back img {
	margin-left: 276px;
	margin-top: 10px;
	width: 24px;
	height: 24px;
	width: 24px;
}

#bigtouxiang {
	background:
		url(${pageContext.request.contextPath}/img/${who.uname }/${who.ulogo});
	background-size: 200px 200px;
	width: 200px;
	height: 200px;
	border: 1px solid white;
	position: relative;
	top: -120px;
	left: 100px;
	border-radius: 3px;
	z-index: 6;
}

#jiazai {
	width: 620px;
	height: 40px;
	background-color: white;
	line-height: 40px;
	font-size: 15px;
	color: black;
	display: none;
	margin-top: -9px;
}

#jiazai img {
	margin-left: 28px;
	display: none;
	margin-top: 10px;
}

#littleloader {
	background-color: rgba(255, 255, 255, 1.00);
	width: 1349px;
	height: 56px;
	box-shadow: 0 0 5px #657786;
	position: relative;
}

#secondloader {
	position: relative;
	left: 360px;
	height: 52px;
	text-align: center;
	width: 800px;
}

#secondloader li {
	float: left;
	width: 60px;
	height: 52px;
	margin-right: 50px;
	cursor: pointer;
	margin-top: 5px;
	font-weight: bold;
	color: #657786;
}

.datadetail {
	font-weight: bold;
	font-size: 16px;
	color: #657786;
}

#editdata {
	position: absolute;
	right: 100px;
	top: 10px;
	font-weight: bold;
	color: black;
}

#firstclass {
	width: 200px;
	height: 400px;
	float: left;
	margin-left: 100px;
	margin-top: 20px;
}

.touxiang {
	width: 32px;
	height: 32px;
	border: 1px solid white;
	background-size: 31px 31px;
	cursor: pointer;
	background:
		url(${pageContext.request.contextPath}/img/${who.uname }/${who.ulogo});
}

#secondclass {
	width: 620px;
	height: 400px;
	float: left;
	margin-left: 60px;
}

#thirdclass {
	width: 300px;
	height: 400px;
	float: left;
	margin-left: 20px;
}

#classdetail {
	width: 1349px;
	height: auto;
	margin-top: 20px;
}

#rname {
	height: 30px;
	width: auto;
	font-size: 20px;
	color: black;
	font-weight: bold;
	margin-top: 10px;
	cursor: pointer;
}

#aitename {
	font-size: 15px;
	height: 30px;
	width: auto;
	color: #657786;
	cursor: pointer;
}

#infos {
	margin-top: 10px;
	color: #657786;
}

.info {
	margin-bottom: 5px;
	cursor: pointer;
}

.info span {
	margin-right: 4px;
}

.tuiwen {
	width: 620px;
	height: auto;
	background-color: white;
	cursor: pointer;
	margin-top: -9px;
}

.tuiwentwo {
	width: 620px;
	height: auto;
	background-color: white;
}

#content {
	width: 620px;
	height: auto;
}

.sender_tou_xiang {
	background-size: 60px 60px;
	border-radius: 5px;
	width: 60px;
	height: 60px;
	position: relative;
	top: 10px;
	left: 10px;
}

.sender_info {
	width: 500px;
	height: auto;
	position: relative;
	left: 80px;
	top: -50px;
}

.sender_name {
	float: left;
	width: auto;
	margin-right: 5px;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
	line-height: 20px;
	color: black;
}

.sender_aite {
	float: left;
	width: auto;
	margin-right: 15px;
	font-size: 13px;
	color: #657786;
	height: 20px;
	line-height: 20px;
}

.sender_time {
	font-size: 15px;
	color: #657786;
	height: 20px;
	line-height: 20px;
}

.neirong {
	width: 500px;
	height: auto;
	margin-top: 5px;
	font-size: 15px;
	color: black;
	word-wrap: break-word;
	word-break: break-all;
}

.sender_gongneng {
	width: 500px;
	position: relative;
	top: 10px;
}

.sender_gongneng ul li {
	float: left;
	width: 80px;
	height: 20px;
	line-height: 20px;
}

.sender_gongneng ul li div {
	font-size: 16px;
	color: #657786;
}

.sender_gongneng ul li div span {
	font-size: 13px;
	color: #657786;
	height: 20px;
	line-height: 20px;
	position: relative;
	top: -4px;
	left: 7px;
}

.sender_pic {
	width: 100%;
	max-height: 400px;
	border-radius: 5px;
}

.sender_pic img {
	width: auto;
	height: auto;
	max-width: 100%;
	max-height: 300px;
	margin: 10px 0px;
	border-radius: 5px;
}

#loaderto {
	width: 620px;
	height: 40px;
	cursor: pointer;
}

#loaderto li {
	margin-left: 13px;
	float: left;
	margin-right: 10px;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	color: rgba(29, 161, 241, 1.00);
}

.tuijian_info {
	width: 240px;
	height: 60px;
	padding-left: 20px;
	z-index: 8;
	padding-left: 20px;
}

.tuijian_touxiang {
	background-size: 50px 50px;
	width: 50px;
	height: 50px;
	margin: 5px;
	float: left;
	background-color: white;
	float: left;
	cursor: pointer;
	border-radius: 3px;
}

.tuijian_name {
	float: left;
	color: black;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
	max-width: 65px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-left: 8px;
	cursor: pointer;
}

.tuijian_aite {
	float: left;
	font-size: 14px;
	margin-left: 5px;
	color: #657786;
	height: 20px;
	width: auto;
	max-width: 80px;
	cursor: pointer;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.guanzhu_btn {
	position: relative;
	top: 3px;
	left: 0px;
	width: 81px;
	height: 32px;
	border: none;
	color: white;
	border-radius: 5px;
	box-shadow: 0 1px 0 #657786;
}

.guanzhu {
	font-size: 20px;
	color: #657786;
	padding-top: 10px;
	padding-left: 10px;
	margin-bottom: 20px;
}

#tuijian {
	width: 265px;
	height: 280px;
	background-color: white;
	box-shadow: 0 0 .5px #657786;
}

.meiyou {
	font-size: 25px;
	margin-left: 50px;
	padding-top: 50px;
}

.kongkong {
	width: 465px;
	font-size: 15px;
	margin-left: 50px;
	padding-top: 10px;
	color: gray;
}

#seluser {
	margin: 30px 0px 50px 50px;
	padding: 10px;
	border: 1px solid white;
	border-radius: 5px;
	font-weight: bold;
	padding: 10px;
}
</style>
<style>
.tweet {
	width: 500px;
	height: auto;
	float: left;
	position: relative;
	top: -20px;
	left: 70px;
}

.wen {
	width: 480px;
	border-radius: 5px;
	z-index: 8;
	margin: 10px 0 10px 10px;
}

textarea {
	resize: none;
	overflow-y: auto;
	width: 100%;
	min-height: 80px;
	border-style: hidden;
}

.thing {
	width: 300px;
	height: 30px;
	position: relative;
	top: -60px;
	left: 70px;
	z-index: 7;
}

.addThing {
	width: 40px;
	height: 40px;
	font-size: 24px;
	cursor: pointer;
	padding: 8px;
	margin-right: 2px;
	position: relative;
	top: 50px;
}

.but {
	width: 80px;
	height: 40px;
	position: relative;
	left: 235px;
	top: 45px;
}

.zishu {
	position: relative;
	left: 445px;
	top: 2px;
	color: gray;
	width: 50px;
	height: 30px;
	font-size: 16px;
	font-style: oblique;
}

.zishu_lu {
	position: relative;
	left: 455px;
	top: 55px;
	color: gray;
}

.but_lu {
	position: relative;
	left: 290px;
	top: 80px;
}

.add {
	position: relative;
	top: -40px;
	left: 25px;
}

.addx {
	position: relative;
	top: 90px;
}

.tweet {
	border: 1px solid red;
	height: auto;
	border-radius: 5px;
	background-color: white;
}

.ttt {
	position: relative;
	top: 30px;
	left: 20px;
	width: 560px;
	color: powderblue
}

.tuiwencha {
	position: absolute;
	right: -20px;
	top: 0px;
	color: #657786;
}

.deltuiwen {
	position: absolute;
	right: -35px;
	top: -5px;
	width: 80px;
	height: 130px;
	border: 1px solid red;
	background-color: white;
	box-shadow: 0 0 1px red;
	text-align: center;
	line-height: 28px;
	border-radius: 5px;
	z-index: 5;
	display: none;
	height: 30px;
}

.guanzhuta {
	width: 100px;
	height: 25px;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	border: 1px solid${who.ucolor
}

;
}
#souxianshi {
	width: 330px;
	height: auto;
	background-color: white;
	box-shadow: 0 0 1.5px gray;
	position: fixed;
	top: 49px;
	left: 885px;
	border-radius: 3px;
	display: none;
}

#souxianshishang {
	position: fixed;
	left: 905px;
	z-index: 999999;
	margin-top: 1px;
	display: none;
}

.souneirong {
	width: 330px;
	height: 50px;
	line-height: 50px;
	cursor: pointer;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width: 330px;
}

.soumingzi {
	float: left;
	font-weight: bold;
	font-size: 16px;
	color: black;
	margin-left: 10px;
	min-width: 35px;
	max-width: 200px;
	margin-right: 6px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.soutouxiang {
	float: left;
}

.soutouxiang img {
	width: 30px;
	height: 30px;
	border-radius: 50px;
	margin-top: 10px;
	margin-left: 20px;
}

.sousouaite {
	height: 50px;
	min-width: 50px;
	max-width: 200px;
	font-size: 14px;
	color: rgb(101, 119, 134);
	margin-left: 5px;
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>

<body>
	<div id="loader">
		<div>
			<ul id="daohang">
				<li><span class="glyphicon glyphicon-home"></span><span
					class="bian">主页</span></li>
				<li><span class="glyphicon glyphicon-bell"></span><span
					class="bian">通知</span></li>
				<li><span class="glyphicon glyphicon-comment"></span><span
					class="bian">私信</span></li>
			</ul>
		</div>
		<div>
			<img id="logo" src="img/index.ico" />
			<div id="search">
				<input type="text" class="search" id="search_two"
					placeholder="搜索Twitter用户" /><span
					class="glyphicon glyphicon-search sea" id="chaxun"
					style="color:gray;font-size: 15px;margin-top:1px"></span>
			</div>
			<div class="triangle shang" id="souxianshishang"></div>
			<div id="souxianshi"></div>
			<div class="touxiang" id="touxiang"
				style="background-size:31px 31px;background:url(${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo})"></div>
			<div id="list">
				<div class="triangle shang ss"></div>
				<div id="listlist">
					<div style="cursor: pointer;" id="self">
						<div id="uname"
							style="font-weight: bold; color:black;margin-top:5px;margin-left:18px;font-size:20px">${user.urealname }</div>
						<div style="color:gray;margin-left:20px;font-size:15px">@${user.uaite }</div>
					</div>
					<hr>
					<div class="listd" style="margin-top: 10px">
						<div>
							<span class=" glyphicon glyphicon-user"
								style="margin-right: 10px"></span>个人资料
						</div>
					</div>

					<div class="listd">
						<span class="glyphicon glyphicon-list-alt"
							style="margin-right: 10px"></span>列表
					</div>
					<hr>
					<div class="listd">
						<span class="glyphicon glyphicon-share" style="margin-right: 10px"></span>Twitter广告
					</div>
					<div class="listd">
						<span class=" glyphicon glyphicon-stats"
							style="margin-right: 10px"></span>分析
					</div>
					<hr>
					<div class="listd">设置与隐私</div>
					<div class="listd">帮助中心</div>
					<div class="listd">键盘快捷键</div>
					<div class="listd">登出</div>
				</div>
			</div>
			<button id="fatui" class="button btn btn-info">
				<span class="glyphicon glyphicon-send edit"></span><span
					class="bian fa">发推</span>
			</button>
		</div>
		<div id="popup">
			<div class="title">
				<p data-title="撰写新推文"></p>
				<span>&times</span>
			</div>
			<form action="" method="post" id="mytweettwo"
				enctype="multipart/form-data">
				<div class="cont">
					<div class="tweet ttt" id="tuiwen2">
						<textarea id="tweet2" class="wen xinxian" name="tuiwen"
							placeholder="有什么新鲜事？" style="max-height:300px;width:540px"></textarea>
						<div class="bq bq2"></div>
					</div>

					<div class="thing add">
						<span class="glyphicon glyphicon-camera addThing addx"></span> <span
							class="glyphicon glyphicon-picture addThing addx"></span> <span
							class="glyphicon glyphicon-stats addThing addx"></span> <span
							class="glyphicon glyphicon-map-marker addThing addx"></span>
						<button class="button but but_lu  btn btn-info" id="submittwo"
							type="button">
							<span class="glyphicon glyphicon-send edit_lu"></span> <span
								class="bian fa_lu">发推</span>
						</button>
					</div>
					<div class="zishu zishu_lu">140</div>

				</div>
			</form>
		</div>

		<div id="mask_shadow"></div>
	</div>
	<div id="bg"></div>
	<div id="bigtouxiang"></div>
	<div id="body">
		<div id="littleloader">
			<ul id="secondloader">
				<li>
					<div>推文</div>
					<div class="datadetail" id="tweetnum">${who.utweet}</div>
				</li>
				<li>
					<div>正在关注</div>
					<div class="datadetail">${who.ufollow}</div>
				</li>
				<li>
					<div>关注者</div>
					<div class="datadetail">${who.ufans}</div>
				</li>
			</ul>
			<div>
				<c:if test="${who.guanzhu == 0 }">
					<button class="guanzhuta" id="editdata"
						style="width:150px;height:35px ;color:${who.ucolor}"
						onclick="guanzhuta(this)">关注</button>
				</c:if>
				<c:if test="${who.guanzhu == 1 }">
					<button class="guanzhuta" id="editdata"
						style="border:0px solid red; background-color:${who.ucolor};color:white;width:150px;height:35px"
						onclick="guanzhuta(this)">正在关注</button>
				</c:if>
			</div>
		</div>
		<div id="classdetail">
			<div id="firstclass">
				<div id="rname">${who.urealname }</div>
				<div id="aitename">@${who.uaite }</div>
				<div id="infos">
					<ul>
						<c:if test="${who.uabout != null }">
							<li class="info">${who.uabout }</li>
							<br>
							<br>
						</c:if>

						<li class="info"><span class="glyphicon glyphicon-map-marker"></span>中华人民共和国</li>
						<li class="info" style="margin-left: 1.5px;"><span
							class="glyphicon glyphicon-calendar"></span>加入与 <fmt:formatDate
								value="${who.utime }" pattern="yyyy年M月" type="both" /></li>
						<c:if test="${who.udate != null }">
							<li class="info"><span class="glyphicon glyphicon-heart"></span>生于
								<fmt:formatDate value="${who.udate }" pattern="yyyy年M月d日"
									type="both" /></li>
						</c:if>

					</ul>
				</div>
			</div>
			<div id="secondclass">
				<div class="tuiwentwo">
					<ul id="loaderto">
						<li>推文</li>
						<li>推文与回复</li>
					</ul>
				</div>
				<div id="content"></div>
				<div id="jiazai">
					<img src="img/loader.gif" />
				</div>
				<div id="back" style="margin-bottom: 30px;margin-top: 1px">
					<img src="img/index.ico" /><br> <span
						style="margin-left:256px;">返回顶层↑</span>
				</div>
			</div>
			<div id="thirdclass">
				<div id="tuijian">
					<div class="guanzhu" style="color:black">
						推荐关注<span style="font-size:13px;font-weight: normal;"> · <a
							style="cursor: pointer;" id="shuaxintj">刷新</a></span>
					</div>
					<div id="addtuijian"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		$("#touxiang").popover({
			content : "修改个人信息和登出",
			placement : 'bottom',
			trigger : 'hover '
		});
		$("#logo").popover({
			content : "点击置顶",
			placement : 'bottom',
			trigger : 'hover '
		});
		$(".addThing").popover({
			content : "暂时没用",
			placement : 'bottom',
			trigger : 'hover '
		});

	})
	function catsession() {
		$.ajax({
			url : '/mytwitter/user.do?method=catsession',
			type : 'POST',
			success : function(response, status) {
				if (response == "exit") {
					location = "twitter.jsp?m=1";
				}
			}
		});
	}
	$(function() {
		catsession();
	})
	window.setInterval(function() {
		catsession();
	}, 1000);
</script>
<script>
	var color = "${who.ucolor}";
	$(".button").css("backgroundColor", color);
	$("#touxiang").css("backgroundColor", color);
	$(".dt").css("color", color);
	$("#touxiang").css("backgroundSize", "31px 31px");

	$(".search").on({
		focus : function() {
			$(".search").css("backgroundColor", "rgba(255,255,255,1.00)");
			$(".sear").css("backgroundColor", "rgba(255,255,255,1.00)");
			$("#chaxun").css("backgroundColor", "white");
		},
		blur : function() {
			$(".search").css("backgroundColor", "rgba(245,248,250,1.00)");
			$(".sear").css("backgroundColor", "rgba(245,248,250,1.00)");
			$("#chaxun").css("backgroundColor", "rgba(245,248,250,1.00)");
		}
	});

	$("#logo").click(function(e) {
		e.preventDefault();
		$(document.documentElement).animate({
			scrollTop : 0
		}, 500);
		//支持chrome
		$(document.body).animate({
			scrollTop : 0
		}, 500);
	});

	$("#back").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "");
		},
		click : function(e) {
			e.preventDefault();
			$(document.documentElement).animate({
				scrollTop : 0
			}, 500);
			//支持chrome
			$(document.body).animate({
				scrollTop : 0
			}, 500);
		}
	});

	$("#daohang li").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid " + color);
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("borderBottom", "");
			$(this).css("color", "rgba(102,107,117,1.00)");
		}
	});
	$("#daohang li:eq(0)").on({
		click : function() {
			location = "main.jsp";
		}
	});
	$("#daohang li:eq(1)").click(function() {
		location = "notify.jsp";
	});
	$("#daohang li:eq(2)").click(function() {
		window.open("message.jsp");
	});
	$(".button").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
		}
	});

	$("#touxiang").click(function() {
		$("#list").fadeToggle(10);
	});

	$(document).click(function(e) {
		e = window.event || e; // 兼容IE7
		obj = $(e.srcElement || e.target);
		if ($(obj).is("#touxiang") || ((e.pageX >= 1035 && e.pageX <= 1165) && (e.pageY >= 50 && e.pageY <= 311))) {

		} else {
			$("#list").fadeOut(10);
		}
	});

	$("#secondloader li:eq(0)").css("borderBottom", "4px solid " + color);
	$("#secondloader li:eq(0)").find(".datadetail").css("color", color);
	$("#secondloader li").on({
		mouseover : function() {
			$(this).css("borderBottom", "4px solid " + color);
			$(this).find(".datadetail").css("color", color);
		},
		mouseout : function() {
			$(this).css("borderBottom", "0px solid " + color);
			$(this).find(".datadetail").css("color", "#657786");
			$("#secondloader li:eq(0)").css("borderBottom", "4px solid " + color);
			$("#secondloader li:eq(0)").find(".datadetail").css("color", color);
		}
	});

	$("#secondloader li:eq(1)").on({
		click : function() {
			location = "search.jsp?word=&fw=3";
		}
	});
	$("#secondloader li:eq(2)").on({
		click : function() {
			location = "search.jsp?word=&fw=5";
		}
	});

	$(".guanzhuta").css("border", "1px solid " + color);
	$(".guanzhuta").on({
		mouseover : function() {
			if ($(this).html() == '关注') {
				var yanse = color.substring(0, color.indexOf("1.00"));
				$(this).css("backgroundColor", yanse + "0.1)");
			}
			if ($(this).html() == '正在关注') {
				$(this).html("取消关注");
				$(this).css("backgroundColor", "rgba(172,0,43,1.00)");
			}
		},
		mouseout : function() {
			if ($(this).html() == '关注')
				$(this).css("backgroundColor", "white");
			if ($(this).html() == '取消关注') {
				$(this).css("backgroundColor", color);
				$(this).html("正在关注");
				$(this).css("color", "white");
				$(this).css("border", "0px solid red");
			}
		}
	});
	$(function() {
		$('#popup').popup({
			ifDrag : true,
			dragLimit : true
		});
	});

	$(".listd").on({
		mouseover : function() {
			$(this).css("backgroundColor", color);
			$(this).css("color", "white");
		},
		mouseout : function() {
			$(this).css("backgroundColor", "white");
			$(this).css("color", "black");
		}
	});

	$(".listd:first").click(function() {
		location = "selfdetail.jsp";
	});

	$("#self").click(function() {
		location = "selfdetail.jsp";
	});

	$(".listd:last").click(function() {
		location = "user.do?method=exit";
	});
</script>
<script>
	$(".wen").css("border", "0px solid lightsalmon");
	$(".wen").css("color", color);
	$(".tweet").css("border", "2px solid rgb(164, 217, 249)");
	$(".addThing").css("color", color);
	$(".xinxian").focus();
	$(".wen").on({
		focus : function() {
			if ($(this).trim().val() == "" || $(this).val() == null) {
				$(".wen").css("color", "black");
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border", "1px solid " + color);
		},
		blur : function() {
			if ($(this).val() == "" || $(this).val() == null) {
				$(".wen").css("color", color);
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border", "2px solid rgb(164, 217, 249)");
		}
	});

	$(".addThing").on({
		mouseover : function() {
			$(this).css("color", "#657786");
		},
		mouseout : function() {
			$(this).css("color", color);

		}
	});

	autosize(document.querySelectorAll('textarea'));

	if ($(".wen").val() == "") {
		$(".but").attr("disabled", "true");
	}

	$("#tuiwen2").bind('input oninput', function() {
		$(".cont").css("height", $(this).height() + 100 + "px");
	});
	$(".cont").css("height", "200px");
	$(".wen").bind('input oninput', function() {
		var zishu = 140 - $(this).val().length;
		$(".zishu").html(zishu);

		if (zishu < 0) {
			$(".zishu").css("color", "lightcoral");
			$(".zishu").css("fontWeight", "bold");
			$(".wen").css("color", "lightcoral");
			$(".but").attr("disabled", "true");
		} else {
			$(".zishu").css("color", "#657786");
			$(".zishu").css("fontWeight", "");
			$(".wen").css("color", "black");
			$(".but").removeAttr("disabled");
			if ($(this).val() == "") {
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
		}
	});
	$(".wen").on({
		blur:function(){
			if ($(this).val() == "" || $(this).val().length>140) {
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
		}
	});
	
	var mytwitter  =' ${pageContext.request.contextPath}';
	var number = ${who.utweet}+"";
	var one = "1";
	var zero = "0";
	var page = 0;
	var jian = 125;
	$(window).scroll(function(event) {
		var winPos = $(window).scrollTop();
		var viewH = $(this).height();
		var contentH = $("#content").get(0).scrollHeight;
		if (/* winPos == contentH-jian */ $(document).scrollTop() + $(window).height()  > $(document).height()) {
			 	jian = 114;
				page += 20;
				if ($(document).scrollTop() > 400 && $(".tuiwen").length>1) {
					$("#jiazai").show();
					jiaZai();
					if( page >= $("#tweetnum").html().trim()){
						page=0;
						$("#jiazai img").fadeOut();
						$("#back").fadeIn();
						jiaZai();
					}
				}
		}
	});
	
	function jiaZai() {
		if( $("#back").css("display") == "none"){
			$('#jiazai img').fadeIn();
			var url = '/mytwitter/tweettwo.do?method=gettweets&num=one&who=other&pagenum='+page;
			$.ajax({
				url : url,
				// '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val(),
				type : 'POST',
				success : function(response, status) {
					$("#jiazai img").fadeOut();
					var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
					var html = addTweet(tweets);
					$("#content").append(html);
					tweetsJs();
				}
			});
		}else{
				$("#jiazai").html("<p style='color:#657786;margin-left:245px'>没有更多了哦！</p>")
				$("#jiazai img").fadeOut();
		}
	};
	function hasNew() {
		$.ajax({
			url : '/mytwitter/tweettwo.do?method=gettweets&num=one&who=other&pagenum='+page,
			type : 'POST',
			success : function(response, status) {
				var length = response.length;
				if(length == 0){
					var html ='<div class="tuiwen"><div class="meiyou">该用户还没有发布过推文。</div>'
					+'<div class="kongkong">快喊他一起来发布推文吧！</div>'
					+'	<input class=" btn btn-info" id="seluser" type="button"	value="发推给TA" /></div>';
					$("#content").append(html);
					return;
				}else{
					var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
					var html = addTweet(tweets);
					$("#content").append(html);
				}
				 tweetsJs();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}			
		});
	};
	
	function addTweet(tweets){
	var html = "";
	for (var i = 0; i < tweets.length; i++) {
	 if(tweets[i].tcontent =="" && tweets[i].tpic == null){
				 	continue;
				 }else{
				 	html += '<div class="tuiwen"><div class="sender_tou_xiang"	style="background: url(\''
				 	+mytwitter+'/img/'+tweets[i].uname+"/"+tweets[i].ulogo+ '\');background-size: 60px 60px"></div><div class="sender_info"><div class="sender_name" style="font-weight: bold;">'
						+tweets[i].urealname+'</div><div class="sender_aite">'+'@'+tweets[i].uaite+'</div><span style="float:left;margin-right:5px">·</span><div class="sender_time">'
						+tweets[i].time +'</div><span class=" glyphicon glyphicon-chevron-down tuiwencha"></span><div class="deltuiwen">删除推文</div><input class="idid" type="hidden" value="'
						+tweets[i].tid+'"/><div class="neirong">'
						+tweets[i].tcontent+'';
					if(tweets[i].tzhuan>0){
							if(tweets[i].utweets.tcontent =="" && tweets[i].utweets.tpic == null){
				 				html +='<div class="tzhuan"style="width: 500px;height: auto;min-height: 50px ;border: 1px solid lightgray;padding:10px 20px 10px 15px;	margin: 10px 0  ;border-radius: 5px; ">';
							html+='<div class="sender_name" style="font-weight: bold;">'+tweets[i].utweets.urealname+'</div><div class="sender_aite">'
						+'@'+tweets[i].utweets.uaite+'</div><div class="sender_time"></div><div class="neirong" style="color:red"><img src=\'img/error.png\' style="margin-top:-2px">'
						+'该推文已被删除！'+'</div>';
						
						html+='</div>'
						 }else{
						 html +='<div class="tzhuan"style="width: 500px;height: auto;min-height: 50px ;border: 1px solid lightgray;padding:10px 20px 10px 15px;	margin: 10px 0  ;border-radius: 5px; ">';
							html+='<div class="sender_name" style="font-weight: bold;">'+tweets[i].utweets.urealname+'</div><div class="sender_aite">'
						+'@'+tweets[i].utweets.uaite+'</div><div class="sender_time"></div><div class="neirong">'
						+tweets[i].utweets.tcontent+'';
						if(tweets[i].utweets.tpic != null){
								html+='<a style="margin-left:10px;z-index:9999" target="view_window" href="'
							+mytwitter+'/img/'+tweets[i].uname+'/'+tweets[i].utweets.tpic+'" >图片</a>';
						}
						html+='</div></div>'						 
						 }
						}
						html+='</div>';
						if(tweets[i].tpic != null){
							html+='<div class="sender_pic"><img src="'
						+mytwitter+'/img/'+tweets[i].uname+'/'+tweets[i].tpic+'" /></div>';
						}
						
						html+='<div class="sender_gongneng"><ul><li><div class="glyphicon glyphicon-share-alt huifu"><span class="huifuCount"> ';
						
						if(tweets[i].treply > zero){
						html+=tweets[i].treply;
						}
						html+='</span></div></li><li>'	;
						if(tweets[i].zhuaned == one){
						html+='<div class="glyphicon glyphicon-retweet zhuanfa" style="color:rgb(23, 191, 99)"><span class="zhuanfaCount" style="color:rgb(23, 191, 99)">';
						if(tweets[i].tforward > zero){
							html+=tweets[i].tforward;
						}
						html+='</span></div>';
						}
						if(tweets[i].zhuaned == zero){
							html+='<div class="glyphicon glyphicon-retweet zhuanfa"><span class="zhuanfaCount">';
							if(tweets[i].tforward > zero){
								html+=tweets[i].tforward;
							}
							html+='</span></div>'
						}
					html+='</li><li>';
						if(tweets[i].zaned == one){
							html+='<div class="glyphicon glyphicon-heart zan" onclick="dianzanla(this)" style="color:rgb(226, 38, 77)"><span class="dianzanCount" style="color:rgb(226, 38, 77)">';
							if(tweets[i].tlike> zero){
							html+=tweets[i].tlike;
							}
							html+='</span></div>';
						}
						if(tweets[i].zaned == zero){
							html+='<div class="glyphicon glyphicon-heart zan" onclick="dianzanla(this)" style="color:#657786"><span class="dianzanCount">';
							if(tweets[i].tlike> zero){
							html+=tweets[i].tlike;
							}
							html+='</span></div>';
						}
						html+='</li></ul></div></div></div>';
						
					} 
					}
					return html;
	}
	
	function tweetsJs(){
		$(".guanzhuta").on({
			mouseover : function() {
				if ($(this).html() == '关注') {
					var yanse = color.substring(0, color.indexOf("1.00"));
					$(this).css("backgroundColor", yanse + "0.1)");
				}
				if ($(this).html() == '正在关注') {
					$(this).html("取消关注");
					$(this).css("backgroundColor", "rgba(172,0,43,1.00)");
				}
			},
			mouseout : function() {
				if ($(this).html() == '关注'){
					$(this).css("backgroundColor", "white");
				}
				if ($(this).html() == '取消关注') {
					$(this).css("backgroundColor", color);
					$(this).html("正在关注");
					$(this).css("color", "white");
					$(this).css("border", "0px solid red");
				}
			}
		});
		$(".tuiwen").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgba(245,248,250,1.00)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", " white");
		}
	});
		$(".sender_name").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "black");

		}
	});

	$(".sender_time").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "#657786");

		}
	});

$(".huifu").on({
		mouseover : function() {
			$(this).css("color", "rgb(29, 161, 242) ");
		},
		mouseout : function() {
			$(this).css("color", "#657786");

		},
		click:function(){
			var sender_name = $(this).parent().parent().parent().parent().find(".sender_name").html();
			var sender_aite = $(this).parent().parent().parent().parent().find(".sender_aite").html();
			var sender_time = $(this).parent().parent().parent().parent().find(".sender_time").html();
			var neirong = $(this).parent().parent().parent().parent().find(".neirong").html();	
			var sender_tou_xiang = $(this).parent().parent().parent().parent().parent().find(".sender_tou_xiang").css("background-image");
			var touxiang = sender_tou_xiang.substring(sender_tou_xiang.indexOf('"')*1+1,find(sender_tou_xiang,'"',1));
			
			if($(this).parent().parent().parent().parent().find(".sender_pic").html()!=null){
				var sender_pic = $(this).parent().parent().parent().parent().find(".sender_pic").html();
				var pic = sender_pic.substring(sender_pic.indexOf('"')*1+1,find(sender_pic,'"',1));
				$("#huifu").find(".zhuanfa_xinxi").html(neirong+"<a href='"+pic+"' target='view_window' style='font-size:13px;margin-left:10px'>图片</a>");
			}else{
				$("#huifu").find(".zhuanfa_xinxi").html(neirong);
			}
			$("#huibiaoti").html("回复"+sender_name);
			$("#huifu").find(".zhuanfa_touxiang img").attr("src",touxiang);
			$("#huifu").find(".zhuanfa_name").html(sender_name);
			$("#huifumingzitwo").html(sender_aite);
			$("#huifu").find(".zhuanfa_aite").html(sender_aite);
			$("#huifu").find(".zhuanfa_time").html(sender_time);	
			 tzhuan();
		}
	});

	
	$(".zhuanfa").on({
		mouseover : function() {
		if($(this).css("color") != "rgb(23, 191, 99)"){
				$(this).css("color", "rgb(23, 190, 99)");
				$(this).find(".zhuanfaCount").css("color", "rgb(23, 190, 99)");
			}
			
		},
		mouseout : function() {
			if($(this).css("color") != "rgb(23, 191, 99)"){
				$(this).css("color", "#657786");
				$(this).find(".zhuanfaCount").css("color", "#657786");
			}
			
		},
		click : function() {
			$("#zhuanfa").find("textarea").val("");
			var sender_name = $(this).parent().parent().parent().parent().find(".sender_name").html();
			var sender_aite = $(this).parent().parent().parent().parent().find(".sender_aite").html();
			var sender_time = $(this).parent().parent().parent().parent().find(".sender_time").html();
			var neirong = $(this).parent().parent().parent().parent().find(".neirong").html();	
			var sender_tou_xiang = $(this).parent().parent().parent().parent().parent().find(".sender_tou_xiang").css("background-image");
			var touxiang = sender_tou_xiang.substring(sender_tou_xiang.indexOf('"')*1+1,find(sender_tou_xiang,'"',1));
			var tid = $(this).parent().parent().parent().parent().find(".idid").val();
			var uid = $(this).parent().parent().parent().parent().find(".uuid").val();
			if($(this).parent().parent().parent().parent().find(".sender_pic").html()!=null){
				var sender_pic = $(this).parent().parent().parent().parent().find(".sender_pic").html();
				var pic = sender_pic.substring(sender_pic.indexOf('"')*1+1,find(sender_pic,'"',1));
				$("#zhuanfa").find(".zhuanfa_xinxi").html(neirong+"<a href='"+pic+"' target='view_window' style='font-size:13px;margin-left:10px'>图片</a>");
			}else{
				$("#zhuanfa").find(".zhuanfa_xinxi").html(neirong);
			}
		
			$("#zhuanfa").find(".zhuanfa_touxiang img").attr("src",touxiang);
			$("#zhuanfa").find(".zhuanfa_name").html(sender_name);
			$("#zhuanfa").find(".zhuanfa_aite").html(sender_aite);
			$("#zhuanfa").find(".zhuanfa_time").html(sender_time);	
			$("#zhuanfa").find(".idid").val(tid);
			$("#zhuanfa").find(".uuid").val(uid);	
 			tzhuan(); 
		}
	});
	$(".zan").on({
		mouseover : function() {
			if($(this).css("color") != "rgb(226, 38, 77)"){
				$(this).css("color", "rgb(226,39,78)");
				$(this).find(".dianzanCount").css("color", "rgb(226,39,78)");
			}
			
		},
		mouseout : function() {
			if($(this).css("color") != "rgb(226, 38, 77)"){
				$(this).css("color", "#657786");
				$(this).find(".dianzanCount").css("color", "#657786");
			}
		
		}
	});
		$(".tzhuan").on({
		mouseover : function() {
			$(this).css("border", "1px solid gray")
		},
		mouseout : function() {
			$(this).css("border", "1px solid lightgray")
		}
	});

	$(".tuiwencha").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "#657786")
		},
		click:function(){
			$(this).next().fadeToggle();
		}
	});
	
	$(".deltuiwen").on({
		mouseover : function() {
			$(this).css("background-color", 'rgba(244,79,64,1.00)');
			$(this).css("color", 'white');
		},
		mouseout : function() {
				$(this).fadeOut();
		},
		click:function(){
		   	var tid = $(this).next().val();
	  		deltweet(tid,$(this));
	  		dtNum -= 1;
            $(".datadetail:eq(0)").html(dtNum);
		}
	
	});
	}
	window.onload = function() {
		hasNew();
	}
	
	function deltweet(tid,deltuiwen){
			$.ajax({
              type: "POST",
              url:"tweettwo.do?method=delt&tid="+tid,
   	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                 	deltuiwen.parent().parent().remove();
                }
            });
	
	}
	
	 var dtNum = "${info.utweet}"*1;
	$("#submittwo").click(function(){
	  var formData = new FormData($( "#mytweettwo" )[0]);  
		$.ajax({
                type: "POST",
                url:"tweettwo.do?method=newt",
                type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                 	$(".zishu").html(140);
                 	//$(".title span").click();
                 	$("#logo").attr("src", "img/index.ico");
                 	$("#tweet2").val("");
                }
            });
	}); 
  $("#chaxun").on({
    	click:function(){
    		if($(".search").val() != ""){
    			var word = $(".search").val();
    			location="search.jsp?word="+word;
    		}
    	}
    });
    $("#search_two").val("");
    $('#search_two').bind('keypress',function(event){ 
         if(event.keyCode == 13)   {  
			if($(".search").val() != ""){
    			var word = $(".search").val();
    			location="search.jsp?word="+word;
    		}
         }  

     });
   $("#search_two").bind('input propertychange ', function() {
		if ($(this).val().trim() != "") {
			$(this).css("color", "black");
		} else {
			$(this).css("color", "gray");
		}
	});
		$("#search_two").bind("input change", function() {

		var name = $(this).val();
		if ($(this).val() == "") {
			$("#souxianshi").hide();
			$("#souxianshishang").hide();
		}
		var url = '/mytwitter/user.do?method=chayonghu';
		if ($(this).val() != "") {
			$.ajax({
				url : url,
				data : {
					"name" : name
				},
				type : 'POST',
				success : function(response, status) {
					$("#souxianshi").html("");
					$("#souxianshi").show();
					$("#souxianshishang").show();
					if (response == "kong") {
						var html = '<div class="souneirong"><span style="margin-left:20px;font-size:15px;">没有与<b><span style="margin:0 3px;">' + name + '</span></b>相关用户！</span></div>';
						$("#souxianshi").append(html);
						return;
					}
					var length = response.length;
					var users = $.parseJSON(response.substring(response.indexOf("["), response.length));
					var html = "";
					for (var i = 0; i < users.length; i++) {
						html += '<div class="souneirong" onclick="chaxunuser(0,this)"><div class="soutouxiang"><img src="'
							+ mytwitter + '/img/' + users[i].uname + "/" + users[i].ulogo + '" /></div><div class="soumingzi">'
							+ users[i].urealname + '</div><div class="sousouaite">@' + users[i].uaite + '</div><input class="uid" type="hidden" value="'
							+ users[i].uid + '"/></div>';
					}
					html += '<div class="souneirong" onclick="chaxunuser(1,this)"><span style="margin-left:20px;font-size:15px">搜索与<span style="margin:0 3px"><b>' + name + '</b></span>相关的所有用户</span></div>';
					$("#souxianshi").append(html);
					$(".souneirong").on({
						mouseover : function() {
							$(this).css("backgroundColor", color);
						},
						mouseout : function() {
							$(this).css("backgroundColor", "white");
						}
					});
				}
			});
		}
	});
	function chaxunuser(num, user) {
		if (num == 1) {
			var word = $(user).find("b").html();
			location = "search.jsp?word=" + word;
			return;
		}
		var uid = $(user).find(".uid").val();
		var urealname = $(user).find(".soumingzi").html().trim();
		if (uid ==  ${user.uid}) {
			location = "selfdetail.jsp";
			return;
		}
		location = "user.do?method=iswho&who=" + urealname + "&id=" + uid;
	}
</script>
<script>
	shuaXinTuiJian();
	function shuaXinTuiJian() {
		$.ajax({
			url : '/mytwitter/user.do?method=shuaxintuijian&suiji=' + Math.random(),
			type : 'POST',
			success : function(response, status) {
				var length = response.length;
				var users = $.parseJSON(response.substring(response.indexOf("["), response.length));
				var html = changeTuiJian(users);
				$("#addtuijian").append(html);
				tweetsJs();
				$(" .tuijian_name").on({
					mouseover : function() {
						$(this).css("color", color);
					},
					mouseout : function() {
						$(this).css("color", "black");
					}
				});
			}
		});
	}
	function guanzhuname(button) {
		var uid = $(button).parent().find(".uid").val();
		var name = $(button).html();
		location = "user.do?method=iswho&who=" + name + "&id=" + uid;
	}
	$("#shuaxintj").on({
		click : function() {
			$("#addtuijian").html('');
			shuaXinTuiJian();
		}
	});

	function changeTuiJian(users) {
		var html = "";
		for (var i = 0; i < users.length; i++) {
			html += '<div class="tuijian_info"><div class="tuijian_touxiang" style="background: url(' + mytwitter + '/img/'
				+ users[i].uname + "/" + users[i].ulogo + ');background-size: 50px 50px;"></div><div class="tuijian_name" onclick="guanzhuname(this)">'
				+ users[i].urealname + '</div><div class="tuijian_aite" style="color:#657786">@' + users[i].uaite
				+ '</div><div><button  onclick="guanzhuta(this)" class=" guanzhuta" style="color:${info.ucolor};margin-top:8px;margin-left:8px;border:1px solid ${info.ucolor}">关注</button></div>'
				+ '<input class="uid" type="hidden" value="' + users[i].uid + '"/><input class="uid" type="hidden" value="'
				+ users[i].uid + '"/><input class="uid" type="hidden" value="'
				+ users[i].uid + '"/><input class="uid" type="hidden" value="' + users[i].uid + '"/></div><hr>';
		}

		return html;
	}
	function dianzanla(button) {
		var tid = $(button).parent().parent().parent().parent().find(".idid").val();
		if ($(button).css("color") == "rgb(226, 38, 77)") {
			updateLikes(tid, "del");
			$(button).css("color", "#657786");
			$(button).find(".dianzanCount").css("color", "#657786");
			zanCount = $(button).find(".dianzanCount").html();
			if (zanCount < 2) {
				$(button).find(".dianzanCount").html("");
			} else {
				$(button).find(".dianzanCount").html(zanCount * 1 - 1);
			}
			return;
		}
		if ($(button).css("color") != "rgb(226, 38, 77)") {
			updateLikes(tid, "add");
			zanCount = $(button).find(".dianzanCount").html();
			if (zanCount == "") {
				$(button).find(".dianzanCount").html(1);
			} else {
				$(button).find(".dianzanCount").html(zanCount * 1 + 1);
			}
			$(button).animate({
				color : 'rgb(226, 38, 77)'
			}, 500);
			$(button).find(".dianzanCount").animate({
				color : 'rgb(226, 38, 77)'
			}, 500);
			return;
		}
	}
	function updateLikes(tid, method) {
		$.ajax({
			type : "POST",
			url : "like.do?method=" + method + "&tid=" + tid,
			async : false,
			success : function(data) {
				//Ok
			}
		});
	}
	function updateFollow(uid, method) {
		$.ajax({
			type : "POST",
			url : "concern.do?method=" + method + "&suid=" + uid,
			async : false,
			success : function(data) {
				//Ok
			}
		});
	}
	function guanzhuta(button) {
		if ($(button).css("width") == "150px") {
			var uid = "${who.uid}";
		} else {
			var uid = $(button).parent().next().next().next().next().val();
		}
		if ($(button).html() == '关注') {
			updateFollow(uid, "add");
			$(button).css("backgroundColor", color);
			$(button).html("正在关注");
			$(button).css("color", "white");
			$(button).css("border", "0px solid red");
			return;
		}
		if ($(button).html() == '取消关注') {
			updateFollow(uid, "del");
			$(button).css("backgroundColor", "white");
			$(button).html("关注");
			$(button).css("color", color);
			$(button).css("border", "1px solid " + color);
			return;
		}
	}
	$("#tweet2").keyup(function(event) {
		if (event.ctrlKey && event.keyCode == 13) {
			$("#submittwo").click();
		}
	});
	$(document).keyup(function(event) {
		switch (event.keyCode) {
		case 84:
			$("#fatui").click();
			return;
		case 27:
			$("#guanguanguan").click();
			return;
		}
	});
</script>
</html>