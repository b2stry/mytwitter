<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${user == null }">
	<jsp:forward page="index.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>Twitter&nbsp;/&nbsp;通知</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/easydialog.min.js"></script>
<script src="js/autosize.min.js"></script>
<script src="js/popup.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: "microsoft yahei";
}

body {
	width: 1349px;
	background-color: rgba(230, 236, 240, 1.00);
	min-height: 650px;
	height: 680px;
}

#loader {
	background-color: rgba(255, 255, 255, 1.00);
	width: 100%;
	min-width: 1349px;
	height: 46px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99999999;
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
	border-radius: 3px;
	box-shadow: 0 1px 0 #ccc;
	right: 90px;
	top: 7px;
	top: 7px;
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
	box-shadow: 0 0 2.5px lightslategray;
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
	z-index: 10;
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
	filter: drop-shadow(.5px -.5px .5px lightslategray);
}

.ss {
	position: fixed;
	top: 41px;
	right: 200px;
	z-index: 6;
}

#body {
	width: 1180px;
	height: auto;
	margin: 60px 80px 40px;
	float: left;
}

#second {
	width: 590px;
	height: auto;
	position: absolute;
	left: 380px;
}

#content {
	width: 590px;
	height: atuo;
	position: absolute;
	top: -290px;
}

#third {
	width: 240px;
	height: auto;
	position: absolute;
	left: 980px;
}

#tuijian {
	width: 280px;
	height: 280px;
	background-color: white;
	box-shadow: 0 0 0.5px #e6ecf0;
	margin-left: 10px;
}

#link {
	width: 280px;
	height: 100px;
	background-color: white;
	position: absolute;
	top: -280px;
	box-shadow: 0 0 0.5px #e6ecf0;
}

#lianjie {
	width: 270px;
	height: 60px;
	margin: 20px 10px;
	float: left;
}

#lianjie li {
	float: left;
	margin-right: 9px;
	font-size: 13px;
	color: #657786;
	cursor: pointer;
	height: 20px;
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

.touxiang {
	width: 32px;
	height: 32px;
	border: 1px solid white;
	background-size: 31px 31px;
	cursor: pointer;
}

#user_tou {
	border-radius: 5px;
	position: relative;
	top: 12px;
	left: 25px;
}

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
	border: 0px solid gray;
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
	color: #657786;
	width: 50px;
	height: 30px;
	font-size: 16px;
	font-style: oblique;
}

.zishu_lu {
	position: relative;
	left: 455px;
	top: 55px;
	color: #657786;
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

.guanzhu {
	font-size: 20px;
	color: gray;
	position: absolute;
	top: 70px;
	left: 105px;
}

.guanzhu_info {
	width: 240px;
	height: 205px;
	position: absolute;
	top: 45px;
	left: 10px;
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
	border-radius: 3px;
}

.tuijian_name {
	float: left;
	color: black;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
	max-width: 70px;
	word-wrap: break-word;
	word-break: break-all;
	margin-left: 8px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
}

.tuijian_aite {
	float: left;
	font-size: 14px;
	margin-left: 5px;
	color: gray;
	height: 20px;
	width: auto;
	max-width: 75px;
	word-wrap: break-word;
	word-break: break-all;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
}

.guanzhu_btn {
	position: relative;
	top: 3px;
	left: 0px;
	width: 81px;
	height: 32px;
}

#back {
	width: 590px;
	height: 60px;
	display: none;
	background-color: white;
	box-shadow: 0 0 .5px #e6ecf0;
	cursor: pointer;
	margin-top: 1px;
}

#back img {
	margin-left: 276px;
	margin-top: 20px;
	width: 24px;
	height: 24px;
	width: 24px;
}

.tweet {
	height: auto;
	border-radius: 5px;
	background-color: white;
}

.ttt {
	position: relative;
	top: 30px;
	left: 20px;
	width: 560px;
	color: powderblue;
}

#mask_shadow {
	display: none;
	opacity: 0;
	position: fixed;
	z-index: 98;
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
	z-index: 99;
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
	height: auto;
	background-color: rgba(232, 245, 253, 1);
	border-radius: 0 0 5px 5px;
	min-height: 210px;
}

#jiazai {
	width: 590px;
	height: 40px;
	background-color: white;
	line-height: 40px;
	font-size: 15px;
	color: black;
	display: none;
	box-shadow: 0 0 0.5px #e6ecf0;
	margin-top: -9px;
}

#jiazai img {
	margin-left: 28px;
	display: none;
	margin-top: 10px;
}
</style>
<style>
.guanzhuta {
	width: 100px;
	height: 25px;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	z-index: 999;
}

#souxianshi {
	width: 330px;
	height: auto;
	background-color: white;
	box-shadow: 0 0 1.5px #657786;
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

.tishidian {
	position: fixed;
	width: 6px;
	height: 6px;
	border-radius: 50px;
	top: 12px;
	margin-left: -10px;
	display: none;
}
</style>
<style>
#quanbu {
	width: 590px;
	height: 50px;
	background-color: white
}

#quanbu li {
	float: left;
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	font-weight: bold;
	margin-left: 20px;
	margin-right: 20px;
	cursor: pointer;
}

.notifications {
	width: 590px;
	height: auto;
	background-color: white;
	margin-top: 1px;
	font-size: 16px;
}

.dianzantweet {
	width: 480px;
	height: auto;
	border: 1px solid rgb(228, 232, 245);
	border-radius: 3px;
	cursor: pointer;
}

.dianzantweetname {
	max-width: 480px;
	height: 20px;
	cursor: pointer;
	float: left;
	color: black;
	font-weight: bold;
	margin-left: 10px;
	margin-top: 10px;
	margin-right: 5px;
}

.dianzantweetaite {
	margin-top: 10px;
	color: #657786;
	max-width: 480px;
	height: 20px;
	cursor: pointer;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.dianzantweetneirong {
	margin-left: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: auto;
	cursor: pointer;
	max-width: 460px;
	color: black;
	word-wrap: break-word;
	word-break: break-all;
}
</style>
</head>
<body>
	<div id="loader">
		<div>
			<ul id="daohang">
				<li><span class="glyphicon glyphicon-home"></span><span
					class="bian">主页</span>
					<div class="tishidian"></div></li>
				<li><span class="glyphicon glyphicon-bell"></span><span
					class="bian">通知</span>
					<div class="tishidian"></div></li>
				<li><span class="glyphicon glyphicon-comment"></span><span
					class="bian">私信</span>
					<div class="tishidian"></div></li>
			</ul>
		</div>
		<div>
			<img id="logo" src="img/index.ico" />
			<div id="search">
				<input type="text" class="search" id="search_two"
					placeholder="搜索Twitter用户" /><span
					class="glyphicon glyphicon-search sea" id="chaxun"
					style="color:#657786;font-size: 15px;margin-top:1px"></span>
			</div>
			<div class="triangle shang" id="souxianshishang"></div>
			<div id="souxianshi"></div>
			<div class="touxiang" id="touxiang"></div>
			<div id="list">
				<div class="triangle shang ss"></div>
				<div id="listlist">
					<div style="cursor: pointer;" id="self">
						<div id="uname"
							style="font-weight: bold; color:black;margin-top:5px;margin-left:18px;font-size:20px">${user.urealname }</div>
						<div style="color:gray;margin-left:20px;font-size:15px"
							id="aitevalue">@${user.uaite }</div>
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
					<div class="listd" id="kuaijiejian">键盘快捷键</div>
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
				<p style="color:black;font-weight: bold" data-title="撰写新推文"></p>
				<span id="guanguanguan">&times</span>
			</div>
			<form action="" method="post" id="mytweettwo"
				enctype="multipart/form-data">
				<div class="cont">
					<div class="tweet ttt" id="tuiwen2"
						style="box-shadow: 0 0 1px rgba(164, 217, 249, 1);">
						<textarea id="tweet2" class="wen xinxian" name="tuiwen"
							placeholder="有什么新鲜事？" style="max-height:300px;width:540px"
							autofocus="autofocus"></textarea>
						<div class="bq bq2"></div>
					</div>

					<div class="thing add">
						<span class="glyphicon glyphicon-camera addThing addx"
							id="addpictwo"></span> <span
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
	<div id="body">
		<div id="tuijian">
			<div class="guanzhu" style="color:black">
				推荐关注<span style="font-size:13px;font-weight: normal;"> · <a
					style="cursor: pointer;" id="shuaxintj">刷新</a>
				</span>
			</div>
			<div id="addtuijian" style="padding-top:50px"></div>
		</div>
		<div id="second">
			<div id="content">
				<div id="quanbu">
					<ul>
						<li>全部</li>
						<li style="color:${info.ucolor}">提及</li>
					</ul>
				</div>
				<div id="notify"></div>
				<!-- 没有通知 -->
				<%-- <div class="notifications">
					<div
						style="margin-left:60px;padding-bottom: 30px;padding-top: 30px;">
						<div
							style="font-size: 28px;font-weight: bold;color: black;width: 480px">看看大家是何时关注、提及你，收藏及转推你的推文的。</div>
						<div
							style="font-size: 15px;padding-top: 5px;color: #657786;width: 470px">从喜欢到转推等等等等，一切有关你的推文和关注者的活动都会在此发生。</div>
					</div>
					<div
						style="height:290px;width:480px;margin-left:60px;padding-bottom: 20px;background: url('${pageContext.request.contextPath}/img/like.png');">

					</div>
				</div> --%>
				<!-- 关注 -->
				<%-- 	<div class="notifications">
					<div
						style="margin-left: 60px;padding-top: 10px;height: 26px;line-height: 26px">
						<span class=" glyphicon glyphicon-user"
							style="color:rgba(29, 161, 242, 1);font-size: 16px;margin-right: 5px"></span>
						<img
							style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px"
							src="${pageContext.request.contextPath}/img/${user.uname}/${info.ulogo}" />
					</div>
					<div
						style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">
						<span class="guanzhurenming"
							style="font-weight: bold;margin-right: 5px;cursor: pointer;"
							onclick=chakanwho(this)>夏浅安</span> <input type="hidden"
							class="uuid" value="26" />关注了你<span
							style="margin: 0px 5px;color:#657786">·</span><span
							class="guanzhudetime" style="color:#657786">5分钟</span>
					</div>
				</div> --%>

				<!-- 点赞 -->
				<!-- 
				<div class="notifications" style="margin-top: 1px">
					<div
						style="margin-left: 60px;padding-top: 10px;height: 26px;line-height: 26px">
						<span class=" glyphicon glyphicon-heart"
							style="color:rgba(224, 36, 94, 1);font-size: 16px;margin-right: 5px;"></span>
						<span class="guanzhurenming"
							style="font-weight: bold;margin-right: 5px;cursor: pointer;"
							onclick=chakanwho(this)>夏浅安</span> <input type="hidden"
							class="uuid" value="26" />喜欢了你的推文<span
							style="margin: 0px 5px;color:#657786">·</span><span
							class="dianzandetime" style="color:#657786">5分钟</span>
					</div>
					<div
						style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">
						<div class="dianzantweet">
							<div class="dianzantweetname" onclick=chakanwho(this)>刘霈</div>
							<input type="hidden" class="uuid" value="4" />
							<div class="dianzantweetaite">@elliot</div>
							<div class="dianzantweetneirong">666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666</div>
						</div>
					</div>
				</div> -->
				<!-- 转发 -->
				<%-- 	<div class="notifications">
					<div
						style="margin-left: 60px;padding-top: 10px;height: 26px;line-height: 26px">
						<span class=" glyphicon glyphicon-retweet"
							style="color:rgba(23, 191, 99, 1);font-size: 16px;margin-right: 5px"></span>
						<img
							style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px"
							src="${pageContext.request.contextPath}/img/${user.uname}/${info.ulogo}" />
					</div>
					<div
						style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">
						<span class="guanzhurenming"
							style="font-weight: bold;margin-right: 5px;cursor: pointer;"
							onclick=chakanwho(this)>夏浅安</span> <input type="hidden"
							class="uuid" value="26" />转发了你的推文<span
							style="margin: 0px 5px;color:#657786">·</span><span
							class="guanzhudetime" style="color:#657786">5分钟</span>
						<div class="dianzantweetneirong"
							style="margin-left: 0px;max-width:480px">666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666</div>
						<div class="dianzantweet" style="margin-top: 10px;">
							<div class="dianzantweetname" onclick=chakanwho(this)>刘霈</div>
							<input type="hidden" class="uuid" value="4" />
							<div class="dianzantweetaite">@elliot</div>
							<div class="dianzantweetneirong">666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666</div>
						</div>
					</div>
				</div> --%>

				<div id="jiazai">
					<img src="img/loader.gif" />
				</div>
				<div id="back" style="display: block">
					<img src="img/index.ico" />
				</div>
			</div>
		</div>

		<div id="third">
			<div id="link">
				<ul id="lianjie">
					<li>&copy;2017Twitter</li>
					<li>关于</li>
					<li>帮助中心</li>
					<li>博客</li>
					<li>状态</li>
					<li>工作机会</li>
					<li>条款</li>
					<li>隐私政策</li>
					<li>Cookies</li>
					<li>广告信息</li>
					<li>商标</li>
					<li>广告</li>
					<li>企业</li>
					<li>开发者</li>
				</ul>
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
	window.setInterval(function() {
		shishitongzhi();
	}, 30000);
	window.onload = function() {
		chaxuntongzhi();
	}
	function shishitongzhi() {
		$.ajax({
			url : '/mytwitter/notify.do?method=noread',
			type : 'POST',
			success : function(response, status) {
				if (response > 0) {
					window.document.title = "(" + response + ")Twitter / 通知";
				}
			}
		});
	}

	function notifyJS() {
		$(" .guanzhurenming, .dianzantweetname").on({
			mouseover : function() {
				$(this).css("color", color);
			},
			mouseout : function() {
				$(this).css("color", "black");
			}
		});
		$(".dianzantweet").on({
			mouseover : function() {
				$(this).css("border", "1px solid #657786")
			},
			mouseout : function() {
				$(this).css("border", "1px solid lightgray")
			}
		});
		$(".dianzantweet").on({
			mouseover : function() {
				$(this).css("backgroundColor", "rgba(245,248,250,1.00)");
			},
			mouseout : function() {
				$(this).css("backgroundColor", " white");
			}
		});
	}
	function chakanwho(button) {
		var urealname = $(button).html();
		var uid = $(button).next().val();
		location = "user.do?method=iswho&who=" + urealname + "&id=" + uid;
	}
	$(window).scroll(function(event) {
		var winPos = $(window).scrollTop();
		var viewH = $(this).height();
		var contentH = $("#content").get(0).scrollHeight;
		if ($(document).scrollTop() + $(window).height() > $(document).height()) {
			chaxuntongzhi();
		}
	});
	function chaxuntongzhi() {
		page = $(".notifications").length;
		if (page > 0) {
			page += 1;
		}
		$.ajax({
			url : '/mytwitter/notify.do?method=all&page=' + page,
			type : 'POST',
			success : function(response, status) {
				if (response == 'none' && $(".notifications").length < 1) {
					var html = '<div class="notifications"><div style="margin-left:60px;padding-bottom: 30px;padding-top: 30px;">'
						+ '<div style="font-size: 28px;font-weight: bold;color: black;width: 480px">看看大家是何时关注、提及你，收藏及转推你的推文的。</div>'
						+ '<div	style="font-size: 15px;padding-top: 5px;color: #657786;width: 470px">从喜欢到转推等等等等，一切有关你的推文和关注者的活动都会在此发生。</div>'
						+ '</div><div style="height:290px;width:480px;margin-left:60px;padding-bottom: 20px;background:'
						+ ' url(${pageContext.request.contextPath}/img/like.png);"></div></div>';
					$("#notify").append(html);
					return;
				}
				var notification = $.parseJSON(response);
				var html = addNotify(notification);
				/* 	if (html == "") {
						var html = '<div class="notifications"><div style="margin-left:60px;padding-bottom: 30px;padding-top: 30px;">'
							+ '<div style="font-size: 28px;font-weight: bold;color: black;width: 480px">看看大家是何时关注、提及你，收藏及转推你的推文的。</div>'
							+ '<div	style="font-size: 15px;padding-top: 5px;color: #657786;width: 470px">从喜欢到转推等等等等，一切有关你的推文和关注者的活动都会在此发生。</div>'
							+ '</div><div style="height:290px;width:480px;margin-left:60px;padding-bottom: 20px;background:'
							+ ' url(${pageContext.request.contextPath}/img/like.png);"></div></div>';
						$("#notify").append(html);
						return;
					} */
				$("#notify").append(html);
				notifyJS();
			}
		});
	}
	var mytwitter = ' ${pageContext.request.contextPath}';
	function addNotify(notification) {
		var html = ""
		for (var i = 0; i < notification.length; i++) {
			if (notification[i].ntype == 1) {
				html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px">	<span class=" glyphicon glyphicon-user"'
					+ '	style="color:rgba(29, 161, 242, 1);font-size: 16px;margin-right: 10px"></span><img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px"'
					+ ' src="' + mytwitter + '/img/' + notification[i].usersall.uname + '/' + notification[i].usersall.ulogo + '" /></div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
					+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;"	onclick=chakanwho(this)>'
					+ notification[i].usersall.urealname + '</span> <input type="hidden" class="uuid" value="'
					+ notification[i].usersall.uid + '" />关注了你<span style="margin: 0px 5px;color:#657786">·</span><span'
					+ ' class="guanzhudetime" style="color:#657786">' + notification[i].time + '</span></div></div>';
			}
			if (notification[i].ntype == 2) {
				if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
					continue;
				}
				html += '<div class="notifications"><div style="margin-left: 55px;padding-top: 10px;height: 26px;line-height: 26px">'
				+ '<span class=" glyphicon glyphicon-heart"	style="color:rgba(224, 36, 94, 1);font-size: 16px;margin-right: 15px;"></span><span class="guanzhurenming"'
				+ '	 style="font-size:16px;font-weight: bold;margin-right: 5px;cursor: pointer;"	onclick=chakanwho(this)>'
				+ notification[i].usersall.urealname + '</span> <input type="hidden"	class="uuid" value="'
				+ notification[i].nuid + '" />喜欢了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span'
				+ ' class="dianzandetime" style="color:#657786">' + notification[i].time + '</span></div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
				+ '<div class="dianzantweet"><div class="dianzantweetname" onclick=chakanwho(this)>' + notification[i].utweets.urealname + '</div><input type="hidden" class="uuid" value="'
				+ notification[i].utweets.uid + '" /><div class="dianzantweetaite">@' + notification[i].utweets.uaite + '</div><div class="dianzantweetneirong">'
				+ notification[i].utweets.tcontent;
				if (notification[i].utweets.tpic != null) {
					html += '<a style="margin-left:10px;" target="view_window" href="' + mytwitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.tpic + '">图片</a>';
				}
				html += '</div></div></div></div>';
			}
			if (notification[i].ntype == 3) {
				if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
					continue;
				}
				html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px"><span class=" glyphicon glyphicon-retweet" style="color:rgba(23, 191, 99, 1);font-size: 16px;margin-right: 10px"></span>'
				+ '<img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px" src="'
				+ mytwitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.ulogo + '" />	</div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
				+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;" onclick=chakanwho(this)>'
				+ notification[i].utweets.urealname + '</span> <input type="hidden" class="uuid" value="'
				+ notification[i].utweets.uid + '" />转发了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span class="guanzhudetime" style="color:#657786">'
				+ notification[i].time + '</span><div class="dianzantweetneirong" style="margin-left: 0px;max-width:480px">'
				+ notification[i].utweets.tcontent + '</div><div class="dianzantweet" style="margin-top: 10px;"><div class="dianzantweetname" onclick=chakanwho(this)>'
				+ notification[i].utweetstwo.urealname + '</div><input type="hidden" class="uuid" value="'
				+ notification[i].utweetstwo.uid + '" /><div class="dianzantweetaite">@'
				+ notification[i].utweetstwo.uaite + '</div><div class="dianzantweetneirong">'
				+ notification[i].utweetstwo.tcontent;
				if (notification[i].utweetstwo.tpic != null) {
					html += '<a style="margin-left:10px;" target="view_window" href="' + mytwitter + '/img/' + notification[i].utweetstwo.uname + '/' + notification[i].utweetstwo.tpic + '">图片</a>';
				}
				html += '</div></div></div></div>';
			}
			if (notification[i].ntype == 4) {
				if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
					continue;
				}
				html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px"><span class=" glyphicon glyphicon-share-alt" style="color:rgb(29, 161, 242);font-size: 16px;margin-right: 10px"></span>'
				+ '<img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px" src="'
				+ mytwitter + '/img/' + notification[i].usersall.uname + '/' + notification[i].usersall.ulogo + '" />	</div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
				+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;" onclick=chakanwho(this)>'
				+ notification[i].usersall.urealname + '</span> <input type="hidden" class="uuid" value="'
				+ notification[i].usersall.uid + '" />回复了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span class="guanzhudetime" style="color:#657786">'
				+ notification[i].time + '</span><div class="dianzantweetneirong" style="margin-left: 0px;max-width:480px">'
				+ notification[i].nrcontent + '</div><div class="dianzantweet" style="margin-top: 10px;"><div class="dianzantweetname" onclick=chakanwho(this)>'
				+ notification[i].utweets.urealname + '</div><input type="hidden" class="uuid" value="'
				+ notification[i].utweets.uid + '" /><div class="dianzantweetaite">@'
				+ notification[i].utweets.uaite + '</div><div class="dianzantweetneirong">'
				+ notification[i].utweets.tcontent;
				if (notification[i].utweets.tpic != null) {
					html += '<a style="margin-left:10px;" target="view_window" href="' + mytwitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.tpic + '">图片</a>';
				}
				html += '</div></div></div></div>';
			}
		}
		return html;
	}
</script>
<script>
	$("#kuaijiejian").click(function() {
		alert("按T编辑新推文，\n\n按Ctrl+Enter发推文");
	});

	$("#tweet2").keyup(function(event) {
		if (event.ctrlKey && event.keyCode == 13) {
			if ($(this).val().trim() > 0) {
				$("#submittwo").click();
			} else {
				$("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
			}
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
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
	var mytwitter = ' ${pageContext.request.contextPath}';
	$(".tuijian_touxiang").css("background", "url('" + touxiang + "')");
	$(".tuijian_touxiang").css("backgroundSize", "50px 50px");
	var one = "1";
	var zero = "0";
	var tuiwenshu = 0;

	function guanzhuta(button) {
		var uid = $(button).parent().next().next().next().next().val();
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
	var color = "${info.ucolor}";
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
	var bg = "${pageContext.request.contextPath}/img/${user.uname }/${info.ubg}";

	$(".touxiang").css("background", "url(" + touxiang + ")");
	$(".touxiang").css("backgroundSize", "31px 31px");
	$("#user_tou_xiang").css("backgroundSize", "80px 80px");
	if ($("#user_tou_xiang img").css("display") == "inline") {
		$("#user_tou_xiang").css("background", color);
	}

	$(".button").css("backgroundColor", color);
	$("#daohang li:eq(1)").css("borderBottom", "5px solid " + color);
	$("#daohang li:eq(1)").css("color", color);
	$(".wen").css("border", "0px solid lightsalmon");
	$(".wen").css("color", color);
	$(".tweet").css("border", "2px solid rgb(164, 217, 249)");

	$(".addThing").css("color", color);
	$(".xinxian").focus();

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

	$("#daohang li").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid " + color);
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("borderBottom", "");
			$(this).css("color", "rgba(102,107,117,1.00)");
			$("#daohang li:eq(1)").css("borderBottom", "5px solid " + color);
			$("#daohang li:eq(1)").css("color", color);
		}
	});

	$("#daohang li:eq(0)").click(function() {
		location = "main.jsp";
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

	$("#seluser").on({
		mouseover : function() {
			$(this).css("webkitFilter", " opacity(.8)");
		},
		mouseout : function() {
			$(this).css("webkitFilter", " opacity(1)");
		}
	});

	$("#touxiang").click(function() {
		$("#list").fadeToggle(10);
	});

	$(document).click(function(e) {
		e = window.event || e; // 兼容IE7
		obj = $(e.srcElement || e.target);
		if ($(obj).is("#touxiang") || ((e.pageX >= 970 && e.pageX <= 1165) && (e.pageY >= 50 && e.pageY <= 401))) {

		} else {
			$("#list").fadeOut(10);
		}
	});

	$("#lianjie li").on({
		mouseover : function() {
			$(this).css("color", color);
			$(this).css("borderBottom", "1px solid " + color);
		},
		mouseout : function() {
			$(this).css("color", "gray");
			$(this).css("borderBottom", "0px solid " + color);
		}
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
		blur : function() {
			if ($(this).val() == "" || $(this).val().length > 140) {
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
		}
	});


	$(".but").click(function() {
		$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
	});

	$("#search_two").bind('input propertychange ', function() {
		if ($(this).val().trim() != "") {
			$(this).css("color", "black");
		} else {
			$(this).css("color", "#657786");
		}
	});

	var dtNum = "${info.utweet}" * 1;
	function tijiao(formData) {
		$.ajax({
			type : "POST",
			url : "tweettwo.do?method=newt",
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				$("#logo").attr("src", "img/index.ico");
				$("#tweet1").val("");
				$("#pics").fadeOut();
				$("#picha").fadeOut();
				$("#ts1").fadeOut();
				$("#pic").val("");
				$(".zishu").html(140);
				$("#tweet2").val("");
				if ($(".meiyou").css("display") == "block") {
					$("#content").html("");
				}
				dtNum += 1;
				$(".dt:eq(0)").html(dtNum);
				var tweets = $.parseJSON(data);
				var html = addTweet(tweets);
				$("#content").prepend(html);
				$("#tongzhi").html("发布推文成功！").fadeIn(300).delay(2000).fadeOut(300);
				tweetsJs();
			}
		});
	}
	$("#submittwo").click(function() {
		var url = '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid=' + $(".tuiwen:eq(0)").find(".idid").val();
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				if (response.length > 1) {
					var tweets = $.parseJSON(response);
					var html = addTweet(tweets);
					$("#content").prepend(html);
					tweetsJs();
					$("#tixing").fadeOut();
					window.document.title = "Twitter";
					$(".glyphicon-home").css("color", "#657786");
				}
				var formData = new FormData($("#mytweettwo")[0]);
				tijiao(formData);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});""
	});

	$(function() {
		$('#popup').popup({
			ifDrag : true,
			dragLimit : true
		});
	});

	$("#chaxun").on({
		click : function() {
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			var word = $(".search").val();
			location = "search.jsp?word=" + word;

		}
	});

	$("#search_two").val("");
	$('#search_two').bind('keypress', function(event) {
		if (event.keyCode == 13) {
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			var word = $(".search").val();
			location = "search.jsp?word=" + word;
		}
	});
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
	$("#shuaxintj").on({
		click : function() {
			$("#addtuijian").html('');
			shuaXinTuiJian();
		}
	});

	function guanzhuname(button){
		var uid = $(button).parent().find(".uid").val();
		var name = $(button).html();
		location="user.do?method=iswho&who="+name+"&id="+uid;
	}
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
</html>
