<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${user == null }">
	<jsp:forward page="index.jsp"></jsp:forward>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>Twitter</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/index.ico" />
<link rel="stylesheet" href="css/cropbox.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/tanchu.css" />
<script src="js/jquery-1.4.4.min.js"></script>
<script src="js/jquery.reveal.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script src="js/easydialog.min.js"></script>
<script src="js/autosize.min.js"></script>
<script src="js/popup.js"></script>
<script src="js/select.js"></script>
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

#bodydetail {
	width: 100%;
	height: auto;
}

#detail {
	width: 290px;
	height: 230px;
	background-color: white;
	border-radius: 3px;
	float: left;
	cursor: pointer;
	position: absolute;
	box-shadow: 0 0 0.5px #e6ecf0;
}

#bg {
	width: 290px;
	height: 100px;
	background-color: white;
	border-radius: 3px 3px 0 0;
	text-align: center;
	line-height: 100px;
}

#second {
	width: 590px;
	height: auto;
	position: absolute;
	left: 380px;
	border-radius: 3px;
}

#send {
	width: 590px;
	height: auto;
	margin-bottom: 10px;
	background-color: rgba(232, 245, 253, 1);
	box-shadow: 0 0 0.5px #e6ecf0;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

#sends {
	width: 590px;
	height: auto;
	z-index: 8;
	min-height: 170px;
}

.tuiwen {
	width: 590px;
	height: auto;
	background-color: white;
	cursor: pointer;
	box-shadow: 0 0 .5px #e6ecf0;
	margin-top: -9px;
}

#content {
	width: 590px;
	height: auto;
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
	border-radius: 3px;
	background-color: white;
	box-shadow: 0 0 0.5px #e6ecf0;
}

#link {
	width: 280px;
	height: 100px;
	border-radius: 3px;
	background-color: white;
	margin-top: 10px;
	position: absolute;
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

#user_tou_xiang {
	background-size: 80px 80px;
	border-radius: 5px;
	width: 80px;
	height: 80px;
	position: relative;
	top: -40px;
	left: 15px;
	background-color: white;
}

#user_tou_xiang img {
	width: 150px;
	height: 150px;
	position: relative;
	top: -35px;
	left: -35px;
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

#username {
	position: relative;
	top: -75px;
	left: 105px;
	font-size: 18px;
	color: black;
	width: auto;
	max-width: 150px;
	min-width: 50px;
}

#aite {
	width: auto;
	position: relative;
	top: -75px;
	left: 105px;
	font-size: 15px;
	color: #657786;
	width: 120px;
}

.zd {
	width: 280px;
}

#ziliao {
	position: relative;
	top: -70px;
	left: 16px;
	color: #657786;
	width: 400px;
	font-size: 14px;
	font-weight: bold;
}

.zliao {
	width: 80px;
	height: 20px;
	float: left;
}

#data {
	position: relative;
	top: -70px;
	left: 15px;
	color: #657786;
}

.dt {
	width: 80px;
	font-size: 17px;
	font-weight: bold;
	float: left;
}

.guanzhu {
	font-size: 20px;
	color: gray;
	position: absolute;
	top: 10px;
	left: 20px;
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
	max-width: 80px;
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
	margin-top: 1.5px;
}

#back img {
	margin-left: 276px;
	margin-top: 10px;
	width: 24px;
	height: 24px;
	width: 24px;
}

#tixing {
	width: 590px;
	height: 40px;
	cursor: pointer;
	background-color: rgb(245, 248, 250);
	margin-top: -9px;
	margin-bottom: 9px;
	display: none;
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

.sender_tou_xiang {
	background-size: 60px 60px;
	border-radius: 5px;
	width: 60px;
	height: 60px;
	position: relative;
	top: 10px;
	left: 10px;
	border: 1px solid white;
}

.sender_info {
	width: 500px;
	height: auto;
	position: relative;
	left: 80px;
	top: -50px;
}

.sender_name {
	max-width: 200px;
	float: left;
	width: auto;
	margin-right: 5px;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
	line-height: 20px;
	color: black;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
}

.sender_aite {
	max-width: 200px;
	float: left;
	width: auto;
	margin-right: 5px;
	font-size: 15px;
	color: #657786;
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
}

.sender_time {
	font-size: 15px;
	color: #657786;
	height: 20px;
	line-height: 20px;
	width: 340px;
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
	top: -2px;
	left: -7px;
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

#pic {
	position: absolute;
	top: -999px;
}

#pics {
	width: 200px;
	height: 200px;
	background-color: white;
	position: absolute;
	z-index: 9;
	background-size: 200px 200px;
	text-align: center;
	line-height: 200px;
	box-shadow: 0 0 0.5px #657786;
	margin-top: -28px;
	border-radius: 5px;
	display: none;
}

#pics img {
	height: 180px;
	max-width: 200px;
	padding: 1px;
	border-radius: 5px;
	line-height: 200px;
	margin-top: 10px;
	cursor: pointer;
}

#picha {
	position: absolute;
	left: 205px;
	margin-top: -30px;
	font-size: 28px;
	display: none;
	cursor: pointer;
}

#changepic {
	position: relative;
	top: -100px;
}

.ts {
	position: relative;
	z-index: 9;
	top: -28px;
	left: 80px;
	display: none;
	top: -28px;
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

.sier {
	width: 600px;
	height: auto;
}

.tuiwencha {
	position: absolute;
	right: 5px;
	top: 0px;
	color: #657786;
}

.deltuiwen {
	position: absolute;
	right: -30px;
	top: 17px;
	width: 100px;
	height: 30px;
	border: 1px solid gray;
	background-color: white;
	box-shadow: 0 0 1px lightgray;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	z-index: 5;
	display: none;
	height: 30px;
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
.usersinfo {
	width: 300px;
	height: auto;
	max-height: 350px;
	min-height: 200px;
	background-color: white;
	border-radius: 5px;
	position: absolute;
	z-index: 999;
	max-height: 350px;
	background-color: white;
}

.usersinfotouxiang {
	margin-top: 69px;
	margin-left: -100px;
}

.usersinfoname {
	margin-top: 35px;
	margin-left: -45px;
}

.bg {
	width: 300px;
	height: 100px;
	border-radius: 5px 5px 0 0px;
	background-size: 280px 100px;
	cursor: pointer;
	z-index: 999;
}

.waiyuan {
	width: 80px;
	height: 80px;
	border-radius: 50px;
	position: relative;
	top: -40px;
	left: 20px;
	background-color: white;
	z-index: 1000;
}

.yuantouxiang {
	width: 70px;
	height: 70px;
	border-radius: 50px;
	background-color: red;
	position: relative;
	top: 5px;
	left: 5px;
	z-index: 1000;
	cursor: pointer;
}

.guanzhuta {
	width: 100px;
	height: 25px;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	z-index: 1000;
}

.waiguanzhu {
	width: 90px;
	height: 25px;
	border-radius: 50px;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	position: relative;
	left: 160px;
	top: -65px;
	z-index: 1000;
}

.realname {
	font-size: 18px;
	font-weight: bold;
	color: black;
	margin-left: 25px;
	margin-top: -60px;
	height: 25px;
	cursor: pointer;
	z-index: 1000;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.uaite {
	height: 20px;
	font-size: 15px;
	color: rgb(102, 117, 171);
	margin-left: 25px;
	cursor: pointer;
	z-index: 1000;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.jianjie {
	width: 250px;
	height: auto;
	margin-left: 25px;
	margin-top: 10px;
	color: black;
	font-size: 13px;
	word-wrap: break-word;
	word-break: break-all;
	cursor: pointer;
	z-index: 1000;
	max-height: 70px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.guanzhuxiangqing {
	margin-left: 5px;
	position: relative;
	bottom: 15px;
	margin-top: 15px;
}

.guanzhuxiangqing span {
	margin-left: 20px;
	margin-top: 15px;
	font-size: 15px;
	font-weight: bold;
	color: #657786;
	font-size: 15px
}

#tongzhi {
	width: 480px;
	height: 50px;
	background-color: white;
	position: fixed;
	top: 47px;
	left: 430px;
	z-index: 9999999;
	border-radius: 3px;
	box-shadow: 0 0 2px #657786;
	text-align: center;
	color: black;
	box-shadow: 0 0 2px gray;
	line-height: 47px;
	display: none;
}

#xiugaitouxiang {
	width: 180px;
	height: 60px;
	background-color: white;
	box-shadow: 0 0 .5px #657786;
	position: absolute;
	left: -30px;
	top: 150px;
	z-index: 999;
	border-radius: 3px;
	display: none;
}

#xiugaitouxiang div {
	width: 180px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	font-size: 15px;
	color: black;
}

#xiugaishang {
	position: absolute;
	left: 45px;
	top: 140px;
	display: none;
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
	z-index: 9;
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
	width: 7px;
	height: 7px;
	border-radius: 50px;
	top: 13px;
	margin-left: -9px;
	display: none;
}

.buchongziliao {
	position: absolute;
	top: 310px;
	width: 290px;
	min-height: 150px;
	height: auto;
	background-color: white;
	border-radius: 3px;
	box-shadow: 0 0 0.5px #e6ecf0;
	background-color: white;
	z-index: 2;
	display: none;
}

.buchongshang {
	position: relative;
	top: -10px;
	left: 15px;
	z-index: 1;
}

#date select {
	padding: 2px;
	border-radius: 5px;
	outline: none;
	border: 1px solid rgb(164, 217, 249);
	height: 30px;
	margin-right: 5px;
}

#notification {
	min-width: 15px;
	width: auto;
	height: 15px;
	margin-left: 5px;
}

#tongzhigeshu {
	font-size: 12px;
	height: 15px;
	position: relative;
	top: -14px;
	left: 4px;
	width: auto;
	color: white;
	position: relative;
}

.huifudename {
	float: left;
	font-size: 16px;
	color: black;
	font-weight: bold;
	height: 30px;
	line-height: 30px;
	margin-right: 5px;
}

.huifudeaite {
	float: left;
	color: #657786;
	height: 30px;
	line-height: 30px;
	font-size: 15px;
	margin-right: 5px;
}

.huifudeshijian {
	color: #657786;
	height: 30px;
	line-height: 30px;
	font-size: 15px;
	margin-left: 5px;
}

.huifudeduixiang {
	color: #657786;
	height: 30px;
	line-height: 30px;
	font-size: 15px;
}

.huifudexiaoxi {
	color: black;
	font-size: 15px;
	padding-bottom: 20px;
	max-width: 480px;
	height: auto;
	word-wrap: break-word;
	word-break: break-all;
	margin-left: 60px;
}
</style>
</head>
<body>
	<div id="tongzhi"></div>
	<div id="loader">
		<div>
			<ul id="daohang">
				<li><span class="glyphicon glyphicon-home"></span><span
					class="bian">主页</span>
					<div class="tishidian" style="background-color: ${info.ucolor};"></div></li>
				<li><span class="glyphicon glyphicon-bell"></span><span
					class="bian">通知</span>
					<div class="tishidian" id="notification"
						style="background-color: ${info.ucolor};">
						<div id="tongzhigeshu"></div>
					</div></li>
				<li><span class="glyphicon glyphicon-comment"></span><span
					class="bian">私信</span>
					<div class="tishidian" style="background-color: ${info.ucolor};"></div></li>
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
			<div class="touxiang" id="touxiang" rel="popover"></div>
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
				<!-- <div class="triangle shang  ts" id="ts2"></div>
					<div id="picstwo">
						<img src="" /> <span class="btn btn-info" id="changepictwo">更换图片</span>
					</div>
					<span id="pichatwo" title="取消预览">&times;</span> <input type="file"
						id="pictwo" accept="image/png,image/jpg" name="tpic" style="z-index:101"/> -->
			</form>
		</div>

		<div id="mask_shadow"></div>
	</div>
	<div id="body">
		<div id="bodydetail">
			<div id="detail">
				<div id="bg"></div>
				<c:if test="${info.ulogo != 'default_profile_normal.png' }">
					<div class="touxiang" id="user_tou_xiang"></div>
				</c:if>
				<c:if test="${info.ulogo == 'default_profile_normal.png' }">
					<div class="touxiang" id="user_tou_xiang">
						<img src="img/owner_empty_avatar.png" />
					</div>
				</c:if>
				<div class="triangle shang " id="xiugaishang"></div>
				<div id="xiugaitouxiang">
					<div class="big-link" data-reveal-id="xiugailogo"
						data-animation="fade" id="shangchuantouxiang">上传头像</div>
					<div id="quxiaoxiugai">取消</div>
				</div>
				<a><div id="username" style="font-weight: bold;">${user.urealname}</div></a>
				<div id="aite">
					@<span class="aite">${user.uaite}</span>
				</div>

				<div id="ziliao">
					<ul class="zd">
						<li class="zliao">推文</li>
						<li class="zliao">正在关注</li>
						<li class="zliao" style="margin-left: 20px">关注者</li>
					</ul>
				</div>
				<div id="data">
					<ul class="zd">
						<li class="dt" id="tweetnum">${info.utweet}</li>
						<li class="dt">${info.ufollow}</li>
						<li class="dt" style="margin-left: 20px">${info.ufans}</li>
					</ul>
				</div>
			</div>
			<!-- 修改头像 -->
			<div class="buchongziliao">
				<div class="triangle shang buchongshang"></div>
				<div style="margin-top:20px;margin-left:20px">
					<div
						style="margin-bottom:10px;font-size:16px;color:black;font-weight: bolder;">选择头像</div>
					<div style="color:black;">拍了张好看的自拍？现在就上传吧。</div>
					<div style="margin-top:20px;margin-left:100px">
						<button class='btn tiaoguo'>跳过</button>
						<button class='btn btn-info' id="tianjiazhaopian">添加照片</button>
					</div>
				</div>
			</div>
			<!-- 简介 -->
			<div class="buchongziliao">
				<div class="triangle shang buchongshang"></div>
				<div style="margin-top:10px;margin-left:20px">
					<div
						style="margin-bottom:5px;font-size:16px;color:black;font-weight: bolder;">介绍你自己</div>
					<div style="color:black;">说说你是谁，你的兴趣是什么。</div>
					<textarea
						style="width:250px;margin:10px 0;border-radius: 5px;border:1px solid rgb(164, 217, 249) ;padding:5px"
						placeholder="介绍你自己..." id="shangchuanabout"></textarea>
					<div style="margin-top:20px;margin-left:130px;margin-bottom: 20px">
						<button class='btn tiaoguo '>跳过</button>
						<button class='btn btn-info' id="baocunjianjie">保存</button>
					</div>
				</div>
			</div>
			<!-- 出生日期 -->
			<div class="buchongziliao">
				<div class="triangle shang buchongshang"></div>
				<div style="margin-top:10px;margin-left:20px">
					<div
						style="margin-bottom:5px;font-size:16px;color:black;font-weight: bolder;">添加你的生日</div>
					<div style="color:black;">让推特和你一起庆祝。</div>
					<div id="date" style="margin-top: 10px;">
						<select name="year" id="year">
							<option value="">年</option>
						</select> <select name="month" id="month">
							<option value="">月</option>
						</select> <select id="days" class="day">
							<option value="">日</option>
						</select>
					</div>
					<div style="margin-top:20px;margin-left:130px;margin-bottom:20px ">
						<button class='btn tiaoguo'>跳过</button>
						<button class='btn btn-info' id="shangchuanshengri">保存</button>
					</div>
				</div>
			</div>
			<!-- 完成 -->
			<div class="buchongziliao">
				<div class="triangle shang buchongshang"></div>
				<div style="margin-top:10px;margin-left:40px">

					<div
						style="margin-bottom:5px;font-size:16px;color:black;font-weight: bolder;">
						<img style="width:48px;height:48px;margin-left: 70px;"
							src="${pageContext.request.contextPath}/img/1f4af.png" /> <span
							style="margin-left: 100px;position: relative;top: -20px;cursor: pointer;"
							id="guanbiwancheng">&times</span>
					</div>

					<div
						style="color:black;font-size: 18px;font-weight: bold;margin-top:10px">棒极了-你已完善个人资料。</div>
					<div style="color:black;font-size: 18px;font-weight: bold">你可以随时更改这些信息。</div>
					<button class="btn btn-info"
						style="margin-top:10px;margin-bottom:20px;margin-left:30px"
						id="chakangerenziliao">查看我的个人资料</button>
				</div>

			</div>
		</div>

		<div id="second">
			<form action="tweettwo.do?method=newt" method="post" id="mytweet"
				enctype="multipart/form-data">
				<div id="send">
					<div class="touxiang" id="user_tou"></div>
					<div id="sends">
						<div class="tweet" id="tuiwen1"
							style=" border :5px solid rgb(164, 217, 249)">
							<div id="editor"></div>
							<textarea class="wen" name="tuiwen" id="tweet1"
								placeholder="有什么新鲜事？"></textarea>
							<div class="bq" id="bq1">
								<!-- <img src="img/Smile.png" width="16px" height="16px" /> -->
							</div>
						</div>
						<div class="thing">
							<span class="glyphicon glyphicon-camera addThing" id="addpic"></span>
							<span class="glyphicon glyphicon-picture addThing"></span> <span
								class="glyphicon glyphicon-stats addThing "></span> <span
								class="glyphicon glyphicon-map-marker addThing "></span>
							<button class="button but btn btn-info" id="submit" type="button">
								<span class="glyphicon glyphicon-send edit_lu"></span><span
									class="bian fa_lu">发推</span>
							</button>
						</div>
						<div class="zishu">140</div>
					</div>
				</div>
				<div class="triangle shang  ts" id="ts1"></div>
				<div id="pics" style="z-index:10000">
					<img src="" /> <span class="btn btn-info" id="changepic">更换图片</span>
				</div>
				<span id="picha" title="取消预览">&times;</span> <input type="file"
					id="pic" accept="image/*" name="tpic" />
			</form>

			<div id="tixing"></div>
			<div id="reload">
				<div id='content'></div>
			</div>
			<div id="jiazai">
				<img src="img/loader.gif" />
			</div>
			<div id="back" style="margin-bottom: 30px;margin-top: 1px">
				<img src="img/index.ico" /><br> <span
					style="margin-left:256px;">返回顶层↑</span>
			</div>
		</div>
		<!--弹出层-->
		<div id="xiugailogo" class="reveal-modal"
			style="width:580px;margin-left:-250px">
			<div class="close-reveal-modal">&#215;</div>
			<div class="containertwo">
				<div class="imageBox">
					<div class="thumbBox"></div>
					<div class="spinner" style="display: none">Loading...</div>
				</div>
				<div class="action">
					<div class="new-contentarea tc">
						<a href="javascript:void(0)" class="upload-img"> <label
							for="upload-file">选择图像</label>
						</a> <input type="file" class="" name="upload-file" id="upload-file" />
					</div>
					<input type="button" id="btnCrop" class="Btnsty_peyton" value="确定">
					<input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+">
					<input type="button" id="btnZoomOut" class="Btnsty_peyton"
						value="-">
				</div>
			</div>
		</div>
		<div id="myModal" class="reveal-modal">
			<div class="close-reveal-modal">&#215;</div>
			<div id="tanchu_touxiang">
				<img src="img/8_150610172935_9.jpg" />
			</div>
			<div id="nameandaite">
				<div id="tanchu_name"></div>
				<div id="tanchu_aite"></div>
			</div>
			<div id="tanchu_neirong"></div>
			<div id="tanchu_time"></div>
			<div id="tanchu_gongneng">
				<ul>
					<li>
						<div class="glyphicon glyphicon-share-alt huifu">
							<span class="huifuCount" style="margin-left:-11px;"></span>
						</div>
					</li>
					<li>
						<div class="glyphicon glyphicon-retweet zhuanfa">
							<span class="zhuanfaCount" style="margin-left:-11px;"></span>
						</div>
					</li>
					<li>
						<div class="glyphicon glyphicon-heart zan"
							style="margin-left: 10px;margin-right: 10px;">
							<span class="dianzanCount" style="margin-left:-12px;"></span>
						</div>
					</li>
				</ul>
			</div>
			<div class="huifuinput">
				<div style="margin-left: 50px;padding-top: 10px;">
					<div style="margin-bottom: 10px;margin-left: 60px;">
						回复 <a id="huifumingzi" style="cursor: pointer;"></a>
					</div>
					<div id="huifuinput_touxiang">
						<img
							src="${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}" />
					</div>
					<textarea id="huifushuru" placeholder="发布你的回复"></textarea>
					<input name="huifutid" class="idid" value="" type="hidden" /> <input
						name="huifuuid" class="uuid" value="" type="hidden" />
					<div style="margin-top: -15px">
						<div id="dahuifuzishu"
							style="position: relative;top:40px;left:380px;width:100px">140</div>
						<button id="huifuanniu" class="btn btn-info">
							<span class="glyphicon glyphicon-share-alt "
								style="padding-right: 5px;font-size: 17px;position: relative;top: 3px;"></span>回复
						</button>
					</div>
				</div>
			</div>
			<div id="huifu_neirong"
				style="background-color: rgb(230,236,240);margin-left: -40px;width: 620px;">
			</div>
			<div id="lasttubiao">
				<img style="margin-top: 26px;" src="img/index.ico" />
			</div>
		</div>

		<div id="huifu" class="reveal-modal">
			<div class="close-reveal-modal">&#215;</div>
			<div id="huibiaoti" class="zhuanfabiaoti"></div>
			<div class="zhuanfa_neirong">
				<div class="zhuanfa_touxiang">
					<img src="img/8_150610172935_9.jpg" />
				</div>
				<div class="zhuanfa_xiangqing" style="width: 500px;">
					<div class="zhuanfa_name"></div>
					<div class="zhuanfa_aite"></div>
					<p style="float: left;">&nbsp;·&nbsp;</p>
					<div class="zhuanfa_time"></div>
				</div>
				<div class="zhuanfa_xinxi"></div>
			</div>
			<div class="huifuinput"
				style="margin-top:30px;margin-bottom: -40px;height: 180px;">
				<div style="margin-left: 22px;padding-top: 10px;">
					回复 <a id="huifumingzitwo" style="cursor: pointer;"></a>
				</div>
				<textarea id="tuichukuang2" style="margin-top: 10px;"
					class="zhuanfashuru" placeholder="发布你的回复"></textarea>
				<input name="huifutid" class="idid" value="" type="hidden" /> <input
					name="huifuuid" class="uuid" value="" type="hidden" />
				<div style="margin-top: -20px">
					<div id="huifuzishu"
						style="position: relative;top:40px;left:450px;width:100px">140</div>
					<button id="huifuhuifu" class="btn btn-info zhuanfaanniu"
						style="margin-left: 60px;">
						<span class="glyphicon glyphicon-share-alt "
							style="padding-right: 5px;font-size: 17px;position: relative;top: 3px;"></span>回复
					</button>
				</div>
			</div>
		</div>

		<div id="zhuanfa" class="reveal-modal">
			<div class="close-reveal-modal">&#215;</div>
			<div class="zhuanfabiaoti">转推给你的关注者？</div>
			<form id="zhuantuiform" action="" method="post"
				enctype="multipart/form-data">
				<div class="huifuinput" style="height: 120px;">
					<textarea id="tuichukuang3" name="zhuanfaneirong"
						class="zhuanfashuru" placeholder="添加评论..."></textarea>
					<input name="zhuanfatid" class="idid" value="" type="hidden" /> <input
						name="zhuanfauid" class="uuid" value="" type="hidden" />
				</div>
				<div class="zhuanfa_neirong">
					<div class="zhuanfa_touxiang">
						<img src="img/8_150610172935_9.jpg" />
					</div>
					<div class="zhuanfa_xiangqing" style="width: 500px;">
						<div class="zhuanfa_name"></div>
						<div class="zhuanfa_aite"></div>
						<p style="float: left;">&nbsp;·&nbsp;</p>
						<div class="zhuanfa_time"></div>
					</div>
					<div class="zhuanfa_xinxi"></div>
					<div style="height: 10px;width: 100%"></div>
					<div style="margin-top: -15px">
						<div id="zhuantuizishu"
							style="position: relative;top:40px;left:410px;right:10px;;width:30px;">140</div>
						<button id="zhuantui" type="button"
							class="btn btn-info zhuanfaanniu" style="left:450px;;">
							<span class="glyphicon glyphicon-retweet"
								style="padding-right: 5px;font-size: 17px;position: relative;top: 3px;"></span>转推
						</button>
					</div>
				</div>
			</form>
		</div>

		<div id="third">
			<div id="tuijian">
				<div class="guanzhu" style="color:black">
					推荐关注<span style="font-size:13px;font-weight: normal;"> · <a
						style="cursor: pointer;" id="shuaxintj">刷新</a>
					</span>
				</div>
				<div id="addtuijian" style="padding-top:50px"></div>
			</div>
			<div id="link">
				<ul id="lianjie">
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
					<li>&copy;2017Twitter</li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	window.setInterval(function() {
		 siliao();
	}, 10000);
	function siliao() {
	 	var url =  '/mytwitter/message.do?method=hasnew';
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				if (response > 0) {	
					$(".tishidian:eq(2)").show();
				}else{
					$(".tishidian:eq(2)").hide();
				}
			}
		});
	};
	$(function() {
		if(${info.uabout == null} || ${info.udate ==null} || ${info.ulogo == "default_profile_normal.png"}){
			$("#tongzhi").html("欢迎来到推特的世界！请尽情展示你的freestyle！").fadeIn(300).delay(1000).fadeOut(300);
		}
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
		$("#addpic").popover({
			content : "添加图片",
			placement : 'bottom',
			trigger : 'hover '
		});
		$(".addThing").popover({
			content : "暂时没用",
			placement : 'bottom',
			trigger : 'hover '
		});
	
		$("#ziliao li:eq(1)").popover({
			content : "点击查看正在关注的人",
			placement : 'bottom',
			trigger : 'hover',
			left : "-25px"
		});
		$("#ziliao li:eq(2)").popover({
			content : "点击查看关注者",
			placement : 'bottom',
			trigger : 'hover',
			left : "-25px"
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
	shishitongzhi();
	window.setInterval(function() {
		shishitongzhi();
	}, 10000);
	var tongzhishu = 0;
	function shishitongzhi() {
		$.ajax({
			url : '/mytwitter/notify.do?method=noread',
			type : 'POST',
			success : function(response, status) {
				if (response > 0 && tongzhishu!=response) {
					tongzhishu = response;
					$("#tongzhigeshu").html(response);
					$("#notification").show();
					if (response * 1 > 9) {
						var tongzhichang = $("#tongzhigeshu").css("width");
						$("#notification").css("width", tongzhichang.substring(0, tongzhichang.indexOf("p")) * 1 + 8 + "px");
					}
				}
			}
		});
	}
</script>
<script>
	$("#chakangerenziliao").click(function(){
		location="selfdetail.jsp";
	});
	$(function(){
		if(${info.ulogo == 'default_profile_normal.png'}){
			$(".buchongziliao:eq(0)").show();
			return;
		}
		if(${info.uabout == null}){
			$(".buchongziliao:eq(1)").show();
			return;
		}
		if(${info.udate == null}){
			$(".buchongziliao:eq(2)").show();
			return;
		}
	});
	$(".tiaoguo:eq(0)").click(function() {
		$(this).parent().parent().parent().hide();
		if(${info.uabout == null}){
			$(".buchongziliao:eq(1)").show();
			return;
		}
		if(${info.udate == null}){
			$(".buchongziliao:eq(2)").show();
			return;
		}
	});
	$(".tiaoguo:eq(1)").click(function() {
		$(this).parent().parent().parent().hide();
		if(${info.udate == null}){
			$(".buchongziliao:eq(2)").show();
		}
	});
	$(".tiaoguo:eq(2)").click(function() {
		$(this).parent().parent().parent().hide();
		if(${info.ulogo != 'default_profile_normal.png'} && ${info.uabout != null} && ${info.udate != null}){
			$(".buchongziliao:eq(3)").show();
		}
	});
	$("#tianjiazhaopian").click(function() {
		$("#user_tou_xiang").click();
	});
	$(function() {
		$("#date").selectDate();
		$("#days").focusout(function() {
			var year = $("#year option:selected").html()
			var month = $("#month option:selected").html()
			var day = $("#days option:selected").html()
			console.log(year + month + day)
		})
	})
	$("#shangchuanshengri").click(function() {
		var year = $("#year option:selected").html()
		var month = $("#month option:selected").html()
		var day = $("#days option:selected").html()
		if (year == "年") {
			$("#tongzhi").html("请选择年份！").fadeIn(300).delay(500).fadeOut(300);
			return;
		}
		if (month == "月") {
			$("#tongzhi").html("请选择月份！").fadeIn(300).delay(500).fadeOut(300);
			return;
		}
		if (day == "日") {
			$("#tongzhi").html("请选择日期！").fadeIn(300).delay(500).fadeOut(300);
			return;
		}
		if (year != "年" && month != "月" && day != "日") {
			xiugaishengri(year + month + day);
		}
	});
	
	function xiugaishengri(data) {
		$.ajax({
			url : '/mytwitter/user.do?method=updatebrithday',
			type : 'POST',
			data : {
				date : data
			},
			success : function(response, status) {
				if(response =="ok"){
					$(".buchongziliao:eq(2)").hide();
					$("#tongzhi").html("修改信息成功！").fadeIn(300).delay(500).fadeOut(300);
					gengxininfo("two");
				}
			}
		});
	}
		
	function gengxininfo(data) {
		$.ajax({
			url : '/mytwitter/user.do?method=gengxininfo&neirong='+data,
			type : 'POST',
			success : function(response, status) {
				if(response == 'ok'){
					$(".buchongziliao:eq(3)").show();
				}
			}
		});
	}
	
	$("#baocunjianjie").click(function() {
		var jianjie = $("#shangchuanabout").val().trim();
		if(jianjie == ""){
			$("#tongzhi").html("请输入介绍！").fadeIn(300).delay(500).fadeOut(300);
			return;
		}
		xiugaijianjie(jianjie);
	});
	function xiugaijianjie(data) {
		$.ajax({
			url : '/mytwitter/user.do?method=updateabout',
			type : 'POST',
			data : {
				about : data
			},
			success : function(response, status) {
				if(response =="ok"){
					$(".buchongziliao:eq(1)").hide();
					$("#tongzhi").html("修改信息成功！").fadeIn(300).delay(500).fadeOut(300);
					if(${info.udate == null}){
						$(".buchongziliao:eq(2)").show();
					}
				}
			}
		});
	}
	$("#guanbiwancheng").click(function(){
		$(".buchongziliao:eq(3)").hide();
	})
</script>
<script>
	$("#kuaijiejian").click(function(){
		alert("\n\n按Ctrl+Enter发推文\n\n");
	});
	$("#tweet1").keyup(function(event){
		if (event.ctrlKey && event.keyCode == 13) {
			if($(this).val().trim() > 0){
					$("#submit").click();
			}else{
				$("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
			}
		 }
	});
	$("#tweet2").keyup(function(event){
		if (event.ctrlKey && event.keyCode == 13) {
			if($(this).val().trim() > 0){
				$("#submittwo").click();
			}else{
				$("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
			}
		 }
	});
	$(document).keyup(function(event){
		 switch(event.keyCode) {
		/*  case 84:
			 $("#fatui").click();
			 return; */
		 case 27:
			 $("#guanguanguan").click();
			  return;
		 }
	});
	$("#user_tou_xiang").click(function(){
		$("#xiugaitouxiang").show();
		$("#xiugaishang").show();		
	});
	$("#xiugaitouxiang div").on({
		mouseover:function(){
			$(this).css("backgroundColor",color);
			$(this).css("color","white");
		},
		mouseout:function(){
			$(this).css("backgroundColor","white");
			$(this).css("color","black");
		}
	});
	$("#quxiaoxiugai").click(function(){
		$("#xiugaitouxiang").hide();
		$("#xiugaishang").hide();		
	});
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
	var mytwitter  =' ${pageContext.request.contextPath}';
	$(".tuijian_touxiang").css("background","url('"+touxiang+"')");
	$(".tuijian_touxiang").css("backgroundSize","50px 50px");
	var number = ${info.utweet}+"";
	var one = "1";
	var zero = "0";
	var tuiwenshu = 0;
	
	function hasNew() {
		$.ajax({
			url : '/mytwitter/tweettwo.do?method=gettweets&pagenum=0',
			type : 'POST',
			success : function(response, status) {
				var length = response.length;
				if( length < 5){
					var html ='<div class="tuiwen" id="kongkong"><div class="meiyou">啥？一条推文都没有？</div>'
					+'<div class="kongkong">这条空空的时间线不能就这么搁着。开始关注用户吧，然后你就会在此看到推文。</div>'
					+'	<input class=" btn btn-info" id="seluser" type="button"	value="寻找值得关注的用户" /></div>';
					$("#content").append(html);
					 tweetsJs();
					return;
				}else{
					var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
					var html = addTweet(tweets);
					$("#content").append(html);
				}
				 tweetsJs();
			}		
		});
	};
	
	function jiaZai() {
		if( $("#back").css("display") == "none"){
			$('#jiazai img').fadeIn();
			var url = '/mytwitter/tweettwo.do?method=gettweets&pagenum='+$(".tuiwen").length;
			$.ajax({
				url : url,
				type : 'POST',
				success : function(response, status) {
					var num = response.length;
					$("#jiazai img").fadeOut();
					if(num <10){
						tuiwenshu =  $(".tuiwen").length;
						$("#jiazai img").hide();
						$("#back").show();
						return;
					}
					var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
					var html = addTweet(tweets);
					$("#content").append(html);
					tweetsJs();
				}
			});
		}
	};
		
		var jian = 403;
		$(window).scroll(function(event) {
	
		if($("#lasttubiao").offset().top - $(window).scrollTop()<250 && $("#myModal").css("visibility")!="hidden"){
			
		}
		if($("#tixing").css("display") == "block" && $("#jiazai").css("display")== "none"){
			jian = 363;
		}else if($("#tixing").css("display") == "block" && $("#jiazai").css("display") == "block"){
			jian = 352;
		}else  if($("#tixing").css("display") == "none" && $("#jiazai").css("display") == "block"){
			jian = 392;
		}else{
			jian = 403;
		}
		var winPos = $(window).scrollTop();
		var viewH = $(this).height();
		var contentH = $("#content").get(0).scrollHeight;
		if (winPos == contentH-jian/* $(document).scrollTop() + $(window).height()  > $(document).height() + 5 */) {			
			 if ($(document).scrollTop() > 400) {
			 	$("#jiazai").show();
				page = $(".tuiwen").length;
					jiaZai();	
			} 
		}
		if( $("#back").css("display") == "block"){
				$("#jiazai img").hide();
				$("#jiazai").html("<p style='color:#657786;margin-left:-10px'>没有更多了哦！</p>");
			}
	});
	function gengXin() {
	 	var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=top&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				if (response > 0) {	
					$("#tixing").fadeIn();
					$("#tixing").html("<span  style='color:" + color + ";position:relative;left:240px;top:10px;font-size:14px'>" + "查看 " + response + "条推文</span>");
					window.document.title = "(" + response + ")Twitter";
					$(".tishidian:eq(0)").show();
				}
			}
		});
	};
	function tianJia() {
	 	var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				var tweets =$.parseJSON(response);
				var html = addTweet(tweets);
				$("#content").prepend(html);
				tweetsJs();
				$("#tixing").hide();
				window.document.title = "Twitter";
				$(".tishidian:eq(0)").hide();
			}
		});
	};
	window.setInterval(function() {
		if($("#kongkong").length <1){
			gengXin();
		}
	}, 15000);
	$("#tixing").on({
		click:function(){
			tianJia();
		}
	});
	//添加新推文
	function addTweet(tweets){
	var html = "";
	for (var i = 0; i < tweets.length; i++) {
				 if(tweets[i].tcontent =="" && tweets[i].tpic == null && tweets[i].tzhaun == 0){
				 	continue;
				 }else{
				 	//推文
				 	html += '<div><div class="tuiwen" ><div onmouseover="tianZiLiaoKa(this)" onmouseout="removeZiLiaoKa(this)" class="sender_tou_xiang" style="z-index:1;background:url(\''
					+ mytwitter+'/img/'+tweets[i].uname+'/'+tweets[i].ulogo+ '\');background-size: 60px 60px;"></div><div class="sender_info"><div onmouseover="nameTianZiLiao(this)" onmouseout="removeZiLiaoKatwo(this)" class="sender_name" style="z-index:99;font-weight: bold;">'
						+tweets[i].urealname+'</div><div class="sender_aite">'+'@'+tweets[i].uaite+'</div><span style="float:left;margin-right:5px">·</span><div class="sender_time">'
						+tweets[i].time +'</div><span class=" glyphicon glyphicon-chevron-down tuiwencha"></span><div class="deltuiwen">删除推文</div><input class="idid" type="hidden" value="'
						+tweets[i].tid+'"/><input class="uuid" type="hidden" value="'
						+tweets[i].uid+'"/><div class="neirong  big-link"  data-reveal-id="myModal" data-animation="fade" onclick="getAllContent(this)">'
						+tweets[i].tcontent+'';
						if(tweets[i].tzhuan>0){
						if(tweets[i].utweets.tcontent =="" && tweets[i].utweets.tpic == null){
				 				html +='<div class="tzhuan"style="width: 500px;height: auto;min-height: 50px ;border: 1px solid lightgray;padding:10px 20px 10px 15px;	margin: 10px 0  ;border-radius: 5px; cursor: pointer;">';
							html+='<div class="sender_name" style="font-weight: bold;">'+tweets[i].utweets.urealname+'</div><div class="sender_aite">'
						+'@'+tweets[i].utweets.uaite+'</div><div class="sender_time"></div><div class="neirong" style="color:red"><img src=\'img/error.png\' style="margin-top:-2px">'
						+'该推文已被删除！'+'</div>';
						
						html+='</div>'
						 }else{
						 html +='<div class="tzhuan"style="width: 500px;height: auto;min-height: 50px ;border: 1px solid lightgray;padding:10px 20px 10px 15px;	margin: 10px 0  ;border-radius: 5px; ">';
							html+='<div class="sender_name" style="font-weight: bold;">'+tweets[i].utweets.urealname+'</div><div class="sender_aite">'
						+'@'+tweets[i].utweets.uaite+'</div><div class="sender_time"></div><div class="neirong" style="width:475px">'
						+tweets[i].utweets.tcontent;
									
						
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
						
						html+='<div class="sender_gongneng"><ul><li><div title="回复" class="glyphicon glyphicon-share-alt huifu  big-link"  data-reveal-id="huifu" data-animation="fade"><span class="huifuCount" style="margin-left:10px;"> ';
						
						if(tweets[i].treply > zero){
						html+=tweets[i].treply;
						}
						html+='</span></div></li><li>'	;
						if(tweets[i].zhuaned == one){
						html+='<div title="转发" class="glyphicon glyphicon-retweet zhuanfa" style="color:rgb(23, 191, 99)"><span class="zhuanfaCount" style="margin-left:13px;color:rgb(23, 191, 99)">';
						if(tweets[i].tforward > zero){
							html+=tweets[i].tforward;
						}
						html+='</span></div>';
						}
						if(tweets[i].zhuaned == zero){
							html+='<div title="转发" class="glyphicon glyphicon-retweet zhuanfa  big-link"  data-reveal-id="zhuanfa" data-animation="fade"><span class="zhuanfaCount" style="margin-left:13px;">';
							if(tweets[i].tforward > zero){
								html+=tweets[i].tforward;
							}
							html+='</span></div>'
						}
						html+='</li><li>';
						if(tweets[i].zaned == one){
							html+='<div title="点赞"  id="zanzan"  onclick="dianzanla(this)" class="glyphicon glyphicon-heart zan" style="color:rgb(226, 38, 77);"><span class="dianzanCount" style="color:rgb(226, 38, 77);margin-left:10px;">';
							if(tweets[i].tlike> zero){
							html+=tweets[i].tlike;
							}
							html+='</span></div>';
						}
						if(tweets[i].zaned == zero){
							html+='<div  title="点赞" id="zanzan" onclick="dianzanla(this)"  class="glyphicon glyphicon-heart zan" style="color:gray;"><span class="dianzanCount" style="margin-left:10px;">';
							if(tweets[i].tlike> zero){
							html+=tweets[i].tlike;
							}
							html+='</span></div>';
						}
						html+='</li></ul></div></div></div></div>';
						
					} 
					
				 }
				 return html;
	}
	
	function getAllContent(button){
		var sender_name = $(button).parent().find(".sender_name").html();
		var sender_aite = $(button).parent().find(".sender_aite").html();
		var sender_time = $(button).parent().find(".sender_time").html();
		var neirong = $(button).html();
		var tid = $(button).parent().find(".idid").val();
		var uid = $(button).parent().find(".uuid").val();
		var dianzanCount = $(button).parent().find(".dianzanCount").html();
		var zhuanfaCount = $(button).parent().find(".zhuanfaCount").html();
		var huifuCount = $(button).parent().find(".huifuCount").html();
		var dianzanyanse = $(button).parent().find(".zan").css("color");
		var zhuanfayanse = $(button).parent().find(".zhuanfa").css("color");
		var sender_tou_xiang = $(button).parent().parent().find(".sender_tou_xiang").css("background-image");
		var touxiang = sender_tou_xiang.substring(sender_tou_xiang.indexOf('"')*1+1,find(sender_tou_xiang,'"',1));
		if($(button).parent().find(".sender_pic").html()!=null){
			var sender_pic = $(button).parent().find(".sender_pic").html();
			var pic = sender_pic.substring(sender_pic.indexOf('"')*1+1,find(sender_pic,'"',1));
			$("#tanchu_neirong").html(neirong+"<a href='"+pic+"' target='view_window' style='font-size:18px;margin-left:10px'>图片</a>");
		}else{
			$("#tanchu_neirong").html(neirong);
		}
		$("#tanchu_touxiang img").attr("src",touxiang);
		$("#tanchu_name").html(sender_name);
		$("#huifumingzi").html(sender_aite);
		$("#tanchu_aite").html(sender_aite);
		$("#tanchu_time").html(sender_time);	
		$("#myModal").find(".idid").val(tid);
		$("#myModal").find(".uuid").val(uid);	
		$("#myModal").find(".zan").css("color",dianzanyanse);
		$("#myModal").find(".zhuanfa").css("color",zhuanfayanse);	
		$("#myModal").find(".dianzanCount").html(dianzanCount);
		$("#myModal").find(".zhuanfaCount").html(zhuanfaCount);	
		$("#myModal").find(".huifuCount").html(huifuCount);
		$("#myModal").find("#huifu_neirong").html("");
		var page = $("#myModal").find(".replys").length;
		getreply(tid, page,sender_aite);
		tzhuan();
		$("#huifuanniu").attr("disabled", "true");
	}
	function replysJs(){
		$(".replys").on({
			mouseover : function() {
				$(this).css("backgroundColor", "rgba(245,248,250,1.00)");
			},
			mouseout : function() {
				$(this).css("backgroundColor", " white");
			}
		});
	}
	function getreply(tid,page,aite){
			$.ajax({
			url : '/mytwitter/reply.do?tid='+tid+'&page='+page,
			type : 'POST',
			success : function(response, status) {
				var replys =$.parseJSON(response);
				var html = addReply(replys, aite);
				$("#huifu_neirong").append(html);
				replysJs();
			}		
		});
	}
	function addReply(replys,aite){
		var html="";
		for(var i = 0; i < replys.length; i++){
				html+='<div style="height: auto;width:100%;background-color: white;margin-top: 1px;cursor: pointer;" class="replys"><div style="padding-top: 8px;padding-left: 40px">'
			+'<div style="width: 60px;height: 100%;float:left;"><img style="width:48px;height:48px;border-radius: 50px" src="'
			+ mytwitter+'/img/'+replys[i].uname+'/'+replys[i].ulogo+'" /></div><div><div class="huifudename">'
			+replys[i].urealname+'</div><div class="huifudeaite">@'+replys[i].uaite+'</div><div style="color:#657786;float: left;height: 30px;line-height: 30px;margin-right: 5px">·</div><div class="huifudeshijian">'
			+replys[i].time+'</div><div class="huifudeduixiang">回复<a style="margin-left: 5px;" href="">'
			+aite+'</a></div><div class="huifudexiaoxi">'+replys[i].rcontent+'</div></div></div></div>';
		}
		return html;
	}
function guanzhuta(button){
		var uid = $(button).parent().next().next().next().next().val();
		if ( $(button).html() == '关注') {
			 updateFollow(uid,"add");
			 $(button).css("backgroundColor", color);
			 $(button).html("正在关注");
			 $(button).css("color", "white");
			 $(button).css("border", "0px solid red");	
			 return;
		}
		if ( $(button).html() == '取消关注') {
			 updateFollow(uid,"del");
			 $(button).css("backgroundColor","white");
			 $(button).html("关注");
			 $(button).css("color", color);
			 $(button).css("border", "1px solid " + color);		
			  return;
		}
}
function find(str,cha,num){
    var x=str.indexOf(cha);
    for(var i=0;i<num;i++){
        x=str.indexOf(cha,x+1);
    }
    return x;
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

	$("#seluser").click(function(){
		location="search.jsp?word=";
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
			$(this).css("color",color);
		},
		mouseout : function() {
			$(this).css("color","black");
		},
		click:function(){
			var uid = $(this).parent().parent().find(".uuid").val();
			var urealname = $(this).html().trim();
			if (uid ==  ${user.uid}) {
				location="selfdetail.jsp";
				return;
			}
			location = "user.do?method=iswho&who=" + urealname + "&id=" + uid;
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
	$(".huifu").on({
		mouseover : function() {
			$(this).css("color", "rgb(29, 161, 242) ");
			$(this).find(".huifuCount").css("color", "rgb(29, 161, 242) ");
		},
		mouseout : function() {
			$(this).css("color", "#657786");
			$(this).find(".huifuCount").css("color", "#657786");

		},
		click:function(){
			var sender_name = $(this).parent().parent().parent().parent().find(".sender_name").html();
			var sender_aite = $(this).parent().parent().parent().parent().find(".sender_aite").html();
			var sender_time = $(this).parent().parent().parent().parent().find(".sender_time").html();
			var neirong = $(this).parent().parent().parent().parent().find(".neirong").html();	
			var tid = $(this).parent().parent().parent().parent().find(".idid").val();
			var uid = $(this).parent().parent().parent().parent().find(".uuid").val();
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
			$("#huifu").find(".idid").val(tid);
			$("#huifu").find(".uuid").val(uid);	
			 tzhuan();
			 $("#huifuhuifu").attr("disabled", "true");
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
			$("#zhuantui").attr("disabled", "true");
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
	
	tzhuan();
	$(".tuiwencha").on({
		mouseover : function() {
			$(this).css("color", color)
		},
		mouseout : function() {
			$(this).css("color", "#657786")
		}
	});
	}
	window.onload = function() {
		hasNew();
	}
	
	function tzhuan(){
		$(".tzhuan").on({
		mouseover : function() {
			$(this).css("border", "1px solid #657786")
		},
		mouseout : function() {
			$(this).css("border", "1px solid lightgray")
		}
	});
		
	}
	var color = "${info.ucolor}";
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
	var bg = "${pageContext.request.contextPath}/img/${user.uname }/${info.ubg}";

	$(".touxiang").css("background", "url(" + touxiang + ")");
	$(".touxiang").css("backgroundSize", "31px 31px");
	 $("#user_tou_xiang").css("backgroundSize", "80px 80px");
     if($("#user_tou_xiang img").css("display") == "inline"){
  	  	$("#user_tou_xiang").css("background", color);
     }
	$(".sender_tou_xiang").css("backgroundSize", "60px 60px");
	$("#bg").css("background", "url(" + bg + ")");
	$("#bg").css("backgroundSize", "300px 100px");
	$("#bg").css("backgroundColor", color);
	$("#touxiang").css("backgroundColor", color);
	$("#seluser").css("backgroundColor", color);

	$(".button").css("backgroundColor", color);
	$("#daohang li:eq(0)").css("borderBottom", "5px solid " + color);
	$("#daohang li:eq(0)").css("color",  color);
	$(".wen").css("border", "0px solid lightsalmon");
	$(".wen").css("color", color);
	$(".tweet").css("border", "2px solid rgb(164, 217, 249)");

	$(".addThing").css("color", color);
	$(".xinxian").focus();
	$(".dt").css("color", color);

	$(".search").on({
		focus : function() {
			$(".search").css("backgroundColor", "rgba(255,255,255,1.00)");
			$(".sear").css("backgroundColor", "rgba(255,255,255,1.00)");
			$("#chaxun").css("backgroundColor","white");
		},
		blur : function() {
			$(".search").css("backgroundColor", "rgba(245,248,250,1.00)");
			$(".sear").css("backgroundColor", "rgba(245,248,250,1.00)");
			$("#chaxun").css("backgroundColor","rgba(245,248,250,1.00)");
		}
	});
	$(".zliao:eq(0), .dt:eq(0)").on({
		click:function(){
			location="selfdetail.jsp";
		}
	});
	$(".zliao:eq(1), .dt:eq(1)").on({
		click:function(){
			location = "search.jsp?word=&fw=1";
		}
	});
	$(".zliao:eq(2), .dt:eq(2)").on({
		click:function(){
			location = "search.jsp?word=&fw=2";
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
			$("#daohang li:eq(0)").css("borderBottom", "5px solid " + color);
			$("#daohang li:eq(0)").css("color",  color);
		}
	});

	$("#daohang li:eq(0)").click(function() {
		location = "main.jsp";
	});
	$("#daohang li:eq(1)").click(function() {
		location = "notify.jsp";
	});
	$("#daohang li:eq(2)").click(function() {
		$(".tishidian:eq(2)").hide();
		window.open("message.do?method=m");   
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

	$("#tixing").click(function() {
		bigdata = 0;
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

	$("#username").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "black");
		},
		click:function(){
			location="selfdetail.jsp";
		}
	});

	$(".aite").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "#657786");
		},
		click:function(){
			location="selfdetail.jsp";
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
		location="selfdetail.jsp";
	});
	
	$("#self").click(function() {
		location="selfdetail.jsp";
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

	$(".addThing").on({
		mouseover : function() {
			$(this).css("color", "#657786");
		},
		mouseout : function() {
			$(this).css("color", color);

		}
	});

	$(".zliao").on({
		mouseover : function() {
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("color", "#657786");

		}
	});

	autosize(document.querySelectorAll('textarea'));

	if ($(".wen").val() == "") {
		$(".but").attr("disabled", "true");
	}

	$("#tuiwen1").bind('input oninput', function() {
		$("#send").css("height", $(this).height() + 80 + "px");
	});
	$("#send").css("height", "180px");
	
    $("#tuiwen2").bind('input oninput change',function(){
		$(".cont").css("height",$(this).height()+100+"px");		
	 });
 	$(".cont").css("height","200px");
	$(".wen").bind('input oninput change', function() {
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
	$("#tuichukuang2").bind('input oninput change', function() {
		var zishu = 140 - $(this).val().length;
		$("#huifuzishu").html(zishu);
		if (zishu < 0) {
			$("#huifuhuifu").attr("disabled", "true");
		}else{
			$("#huifuhuifu").removeAttr("disabled");
			if ($(this).val() == "") {
				$("#huifuhuifu").attr("disabled", "true");
			} else {
				$("#huifuhuifu").removeAttr("disabled");
			}
		}
	});
	$("#tuichukuang3").bind('input oninput change', function() {
		var zishu = 140 - $(this).val().length;
		$("#zhuantuizishu").html(zishu);

		if (zishu<0) {
			$("#zhuantui").attr("disabled", "true");
		} else {
			$("#zhuantui").removeAttr("disabled");
			if ($(this).val() == "") {
				$("#zhuantui").attr("disabled", "true");
			} else {
				$("#zhuantui").removeAttr("disabled");
			}
		}
		
	});
	$("#huifushuru").bind('input oninput change', function() {
		var zishu = 140 - $(this).val().length;
		$("#dahuifuzishu").html(zishu);

		if (zishu<0) {
			$("#huifuanniu").attr("disabled", "true");
		} else {
			$("#huifuanniu").removeAttr("disabled");
			if ($(this).val() == "") {
				$("#huifuanniu").attr("disabled", "true");
			} else {
				$("#huifuanniu").removeAttr("disabled");
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
	
	$("#pic").bind('input oninput change', function() {
		if ($(this).val() != null) {
			var srcs = getObjectURL(this.files[0]);
			$("#pics").fadeIn();
			$("#picha").fadeIn();
			$("#ts1").fadeIn();
			$("#pics img").attr("src", srcs);
		}
	});

	$("#picha").on({
		mouseover : function() {
			$(this).css("color", "red");
		},
		mouseout : function() {
			$(this).css("color", "#657786");

		},
		click : function() {
			$("#pics").fadeOut();
			$("#picha").fadeOut();
			$("#ts1").fadeOut();
			$("#pic").val("");
		}
	});

	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}

	$("#addpic").click(function() {
		return $("#pic").click();
	});
	$("#addpictwo").click(function() {
		return $("#pictwo").click();
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

	$("#pics").on({
		mouseover : function() {
			$("#pics img").stop().animate({
				opacity : 0.5
			}, 1000);
		},
		mouseout : function() {
			$("#pics img").stop().animate({
				opacity : 1
			}, 1000);

		}
	});

	$("#changepic").click(function() {
		return $("#pic").click();
	});

	var dtNum = "${info.utweet}"*1;
	$("#submit").click(function(){
		if($(".meiyou").css("display") == "block"){
			var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid=';
		}else{
			var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
		}
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				if(response.length > 1 ){
					var tweets =$.parseJSON(response);
					var html = addTweet(tweets);
					$("#content").prepend(html);
					tweetsJs();
					$("#tixing").fadeOut();
					window.document.title = "Twitter";
					$(".tishidian:eq(0)").hide();		
				}
				var formData = new FormData($( "#mytweet" )[0]);  
	  			tijiao(formData);	
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});
		
	}); 
	function tijiao(formData){
		
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
                	$("#logo").attr("src", "img/index.ico");
                 	$("#tweet1").val("");
                 	$("#pics").fadeOut();
					$("#picha").fadeOut();
					$("#ts1").fadeOut();
                 	$("#pic").val("");
                 	$(".zishu").html(140);
		            $("#tweet2").val("");      	
                 	if($(".meiyou").css("display") == "block"){
                 		$("#content").html("");
                 	}
                 	dtNum += 1;
                 	$(".dt:eq(0)").html(dtNum);
                    var tweets =$.parseJSON(data);
					var html = addTweet(tweets);
                 	$("#content").prepend(html);
                 	$("#tongzhi").html("发布推文成功！").fadeIn(300).delay(2000).fadeOut(300);
                 	 $("#submit").attr("disabled", "true");
                 	 $("#submittwo").attr("disabled", "true");
                 	 tweetsJs();
                }
            });
	}
	$("#submittwo").click(function(){
		var url =  '/mytwitter/tweettwo.do?method=getnewtweets&td=down&nowid='+$(".tuiwen:eq(0)").find(".idid").val();
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				if(response.length > 1 ){
					var tweets =$.parseJSON(response);
					var html = addTweet(tweets);
					$("#content").prepend(html);
					 tweetsJs();
					 $("#tixing").fadeOut();
					window.document.title = "Twitter";
					$(".tishidian:eq(0)").hide();
				}
	  			var formData = new FormData($( "#mytweettwo" )[0]);  
	  			tijiao(formData);	
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});""
	}); 
		
	$(function () {
     	 $('#popup').popup({ifDrag: true, dragLimit: true});
    });
    
    $("#chaxun").on({
    	click:function(){
    			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
    			var word = $(".search").val().trim();
    			location = "search.jsp?word="+word;

    	}
    });
    
    $("#search_two").val("");
    $('#search_two').bind('keypress',function(event){ 
         if(event.keyCode == 13)   {  
				$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
    			var word = $(".search").val().trim();
    			location = "search.jsp?word="+word;
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
	
	function guanzhuname(button){
		var uid = $(button).parent().find(".uid").val().trim();
		var name = $(button).html().trim();
		location = "user.do?method=iswho&who="+name+"&id="+uid;
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

	$("#zhuantui").on({
		click : function() {
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			var formData = new FormData($("#zhuantuiform")[0]);
			$.ajax({
				type : "POST",
				url : "tweettwo.do?method=zhuantui",
				type : 'POST',
				data : formData,
				async : false,
				contentType : false,
				cache : false,
				processData : false,
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					if (data == "ok") {
						$("#logo").attr("src", "img/index.ico");
						$("#zhuanfa").find(".close-reveal-modal").click();
						$("#tongzhi").html("转发推文成功！").fadeIn(300).delay(1000).fadeOut(300);
						dtNum += 1;
						$(".dt:eq(0)").html(dtNum);
						tianJia();
					}
				}
			});
		}
	});
	$("#huifu").find(".close-reveal-modal").click(function(){
		$("#huifu").find(".zhuanfashuru").val("");
		$("#huifu").find("#huifuzishu").html("140");
	})
	$("#huifuhuifu").on({
		click : function() {
			var huifuneirong = $("#huifu").find(".zhuanfashuru").val().trim();
			var uid = $("#huifu").find(".uuid").val();
			var tid = $("#huifu").find(".idid").val()
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			$.ajax({
				type : "POST",
				url : "tweettwo.do?method=huifu",
				type : 'POST',
				data : {
					huifuneirong:huifuneirong,
					tid:tid,
					uid:uid
				},
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					if (data == "ok") {
						$("#logo").attr("src", "img/index.ico");
						$("#huifu").find(".close-reveal-modal").click();
						$("#tongzhi").html("回复成功！").fadeIn(300).delay(1000).fadeOut(300);
					}
				}
			});
		}
	});
	$("#huifuanniu").on({
		click : function() {
			var huifuneirong = $("#huifushuru").val().trim();
			var uid = $("#myModal").find(".uuid").val();
			var tid = $("#myModal").find(".idid").val()
			$("#logo").attr("src", "img/spinner-rosetta-blue-26x26.gif");
			$.ajax({
				type : "POST",
				url : "tweettwo.do?method=huifu",
				type : 'POST',
				data : {
					huifuneirong:huifuneirong,
					tid:tid,
					uid:uid
				},
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					if (data == "ok") {
						$("#huifushuru").val("");
						$("#logo").attr("src", "img/index.ico");
						$("#tongzhi").html("回复成功！").fadeIn(300).delay(1000).fadeOut(300);
						var html='<div style="height: auto;width:100%;background-color: white;margin-top: 1px;;cursor: pointer;" class="replys"><div style="padding-top: 10px;padding-left: 40px">'
						+'<div style="width: 60px;height: 100%;float:left;"><img style="width:48px;height:48px;border-radius: 50px" src="'
						+ mytwitter+'/img/'+"${user.uname}"+'/'+"${info.ulogo}"+'" /></div><div><div class="huifudename">'
						+"${user.urealname}"+'</div><div class="huifudeaite">@'+"${user.uaite}"+'</div><div style="color:#657786;float: left;height: 30px;line-height: 30px;margin-right: 5px">·</div><div class="huifudeshijian">'
						+'现在'+'</div><div class="huifudeduixiang">回复<a style="margin-left: 5px;" href="">'
						+$("#tanchu_aite").html()+'</a></div><div class="huifudexiaoxi">'+huifuneirong+'</div></div></div></div>';
						$("#huifu_neirong").prepend(html);
						replysJs();
					}
				}
			});
		}
	});
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
	function dianzanla(button) {
		var tid = $(button).parent().parent().parent().parent().find(".idid").val();
		var uid = $(button).parent().parent().parent().parent().find(".uuid").val();
		if ($(button).css("color") == "rgb(226, 38, 77)") {
			updateLikes(tid,uid, "del");
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
			updateLikes(tid,uid, "add");
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

	function updateLikes(tid, uid,method) {
		$.ajax({
			type : "POST",
			url : "like.do?method=" + method + "&tid=" + tid+"&uid="+uid,
			async : false,
			success : function(data) {
				//Ok
			}
		});
	}
	function removeZiLiaoKa(user) {
		/*  $(user).parent().prev().mouseover(function(){
		 		$(this).show();
			}).mouseout(function(){
				$(this).remove();
			});  */
		$(user).parent().prev().remove();
	}
	function removeZiLiaoKatwo(user) {
		/*  $(user).parent().parent().prev().mouseover(function(){
		 		$(this).show();
			}).mouseout(function(){
				$(this).remove();
			});  */
		$(user).parent().parent().prev().remove();
	}
	function nameTianZiLiao(user) {
		var url = '/mytwitter/user.do?method=getziliaoka&uid=' + $(user).parent().parent().find(".uuid").val() + '&suiji=' + Math.random();
		if($(".usersinfo").length < 1){
			$.ajax({
				url : url,
				type : 'POST',
				success : function(response, status) {
					$(".usersinfo").css("marginTop", "30px");
					$(".usersinfo").css("marginLeft", "-40px");
					var tweets = $.parseJSON(response);
					var html = addZiLiaoKa(tweets, "name");
					$(user).parent().parent().before(html);
					tweetsJs();
				}
			});
		}
	}
	function tianZiLiaoKa(user) {
		var url = '/mytwitter/user.do?method=getziliaoka&uid=' + $(user).parent().find(".uuid").val() + '&suiji=' + Math.random();
		if($(".usersinfo").length < 1){
			$.ajax({
			url : url,
			type : 'POST',
			success : function(response, status) {
				var tweets = $.parseJSON(response);
				var html = addZiLiaoKa(tweets, "touxiang");
				$(user).parent().before(html);
				tweetsJs();
			}
		});
		}
	}
	function addZiLiaoKa(tweets, state) {
		var html = "";
		for (var i = 0; i < tweets.length; i++) {
			//资料卡
			if (state == "name") {
				html += '<div class="usersinfo usersinfoname">'
			}
			if (state == "touxiang") {
				html += '<div class="usersinfo usersinfotouxiang">'
			}
			html += '<div class="triangle shang" style="box-shadow:0 0;position:absolute;margin-top:-10px;margin-left:130px"></div><div class="bg" ';
			if (tweets[i].ubg == null) {
				html += 'style="background-color: ' + tweets[i].ucolor + ';'
			} else {
				html += 'style="background-color: ' + tweets[i].ucolor + ';background: url(' + mytwitter + '/img/' + tweets[i].uname + "/" + tweets[i].ubg + ');';
			}
			html += 'background-size: 300px 100px;"></div><div style="width:300px;height:200px;"><div class="waiyuan">' +
				'<div class="yuantouxiang" style="background: url(' + mytwitter + '/img/' + tweets[i].uname + "/" + tweets[i].ulogo + ');background-size: 70px 70px;"></div></div>'
			html += '<div class="waiguanzhu">';
			if ("@" + tweets[i].uaite != $("#aitevalue").html().trim()) {
				if (tweets[i].guanzhu == 1) {
					html += '<button class="guanzhuta" onclick="guanzhuta(this)" style="color:white;background-color:' + color + ';border:0px solid red">正在关注</button>';
				} else if (tweets[i].guanzhu == 0) {
					html += '<button class="guanzhuta" onclick="guanzhuta(this)" style="border:1px solid ${info.ucolor};color:' + color + '";>关注</button>';
				}
			}

			html += '</div><div class="realname">' + tweets[i].urealname + '</div><div class="uaite">@' +
				tweets[i].uaite + '</div><div class="jianjie">' + tweets[i].uabout + '</div><input class="uid" type="hidden" value="' + tweets[i].uid + '"/>';
			html+='<div class="guanzhuxiangqing"><span style="float:left">推文<br><b style="color:${info.ucolor};font-size:18px">'
			+tweets[i].utweet+'</b></span><span  style="float:left;margin-left:50px;">正在关注<br><b style="color:${info.ucolor};font-size:18px">'
			+tweets[i].ufollow+'</b></span><span  style="margin-left:30px;float:left">关注者<br><b style="color:${info.ucolor};font-size:18px">'
			+tweets[i].ufans+'</b></span></div>';
			html+='</div></div>';
		}
		return html;
	}

	$("#shangchuantouxiang").click(function() {
		$("#xiugaitouxiang").hide();
		$("#xiugaishang").hide();
	});

	$(function() {
		var options = {
			thumbBox : '.thumbBox',
			spinner : '.spinner',
			imgSrc : 'img/avatar.jpg'
		}
		var cropper = $('.imageBox').cropbox(options);
		$('#upload-file').on('change', function() {
			var reader = new FileReader();
			reader.onload = function(e) {
				options.imgSrc = e.target.result;
				cropper = $('.imageBox').cropbox(options);
			}
			reader.readAsDataURL(this.files[0]);
			this.files = [];
		})
		$('#btnCrop').on('click', function() {
			var img = cropper.getDataURL();
			var url = '/mytwitter/user.do?method=xiugaitouxiang';
			$.ajax({
				url : url,
				data : {
					"touxiang" : img
				},
				type : 'POST',
				success : function(response, status) {
					if (response == "ok") {
						$("#xiugailogo").find(".close-reveal-modal").click();
						$("#tongzhi").html("修改头像成功！").fadeIn(300).delay(500).fadeOut(300);
						$("#user_tou_xiang").css("background", "url(" + img + ")");
						$("#user_tou_xiang").css("backgroundSize", "80px 80px");
						$("#user_tou_xiang img").hide();
						$("#user_tou").css("background", "url(" + img + ")");
						$("#user_tou").css("backgroundSize", "31px 31px");
						$("#touxiang").css("background", "url(" + img + ")");
						$("#touxiang").css("backgroundSize", "31px 31px");
						$(".buchongziliao:eq(0)").hide();
						if(${info.uabout == null}){
							$(".buchongziliao:eq(1)").show();
							return;
						}else if(${info.udate == null}){
							$(".buchongziliao:eq(2)").show();
							return;
						}else{
							$(".buchongziliao:eq(3)").show();
							return;
						}
					}
				}
			});

		})
		$('#btnZoomIn').on('click', function() {
			cropper.zoomIn();
		})
		$('#btnZoomOut').on('click', function() {
			cropper.zoomOut();
		})
	});
	$("#xiugailogo").find(".close-reveal-modal").click(function() {
		$('#upload-file').val("");
		$(".imageBox").css("backgroundImage", "url('')");
		$(".spinner").show();
	});
	$("#search_two").bind("input change", function() {

		var name = $(this).val().trim();
		if ($(this).val().trim() == "") {
			$("#souxianshi").hide();
			$("#souxianshishang").hide();
		}
		var url = '/mytwitter/user.do?method=chayonghu';
		if ($(this).val().trim() != "") {
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
			var word = $(user).find("b").html().trim();
			location = "search.jsp?word="+word;
			return;
		}
		var uid = $(user).find(".uid").val();
		var urealname = $(user).find(".soumingzi").html().trim();
		if (uid ==  ${user.uid}) {
			location="selfdetail.jsp";
			return;
		}
		location = "user.do?method=iswho&who=" + urealname + "&id=" + uid;
	}
	$("#tixing").on({
		mouseover:function(){
			$(this).css("backgroundColor","rgb(230,236,240)");
		},
		mouseout:function(){
			$(this).css("backgroundColor","rgb(245,248,250)");
		}
	});
</script>
<script>
	(function(factory) {
		if (typeof define === 'function' && define.amd) {
			define([ 'jquery' ], factory);
		} else {
			factory(jQuery);
		}
	}(function($) {
		var cropbox = function(options, el) {
			var el = el || $(options.imageBox),
				obj = {
					state : {},
					ratio : 1,
					options : options,
					imageBox : el,
					thumbBox : el.find(options.thumbBox),
					spinner : el.find(options.spinner),
					image : new Image(),
					getDataURL : function() {
						var width = this.thumbBox.width(),
							height = this.thumbBox.height(),
							canvas = document.createElement("canvas"),
							dim = el.css('background-position').split(' '),
							size = el.css('background-size').split(' '),
							dx = parseInt(dim[0]) - el.width() / 2 + width / 2,
							dy = parseInt(dim[1]) - el.height() / 2 + height / 2,
							dw = parseInt(size[0]),
							dh = parseInt(size[1]),
							sh = parseInt(this.image.height),
							sw = parseInt(this.image.width);

						canvas.width = width;
						canvas.height = height;
						var context = canvas.getContext("2d");
						context.drawImage(this.image, 0, 0, sw, sh, dx, dy, dw, dh);
						var imageData = canvas.toDataURL('image/png');
						return imageData;
					},
					getBlob : function() {
						var imageData = this.getDataURL();
						var b64 = imageData.replace('data:image/png;base64,', '');
						var binary = atob(b64);
						var array = [];
						for (var i = 0; i < binary.length; i++) {
							array.push(binary.charCodeAt(i));
						}
						return new Blob([ new Uint8Array(array) ], {
							type : 'image/png'
						});
					},
					zoomIn : function() {
						this.ratio *= 1.1;
						setBackground();
					},
					zoomOut : function() {
						this.ratio *= 0.9;
						setBackground();
					}
				},
				setBackground = function() {
					var w = parseInt(obj.image.width) * obj.ratio;
					var h = parseInt(obj.image.height) * obj.ratio;

					var pw = (el.width() - w) / 2;
					var ph = (el.height() - h) / 2;

					el.css({
						'background-image' : 'url(' + obj.image.src + ')',
						'background-size' : w + 'px ' + h + 'px',
						'background-position' : pw + 'px ' + ph + 'px',
						'background-repeat' : 'no-repeat'
					});
				},
				imgMouseDown = function(e) {
					e.stopImmediatePropagation();

					obj.state.dragable = true;
					obj.state.mouseX = e.clientX;
					obj.state.mouseY = e.clientY;
				},
				imgMouseMove = function(e) {
					e.stopImmediatePropagation();

					if (obj.state.dragable) {
						var x = e.clientX - obj.state.mouseX;
						var y = e.clientY - obj.state.mouseY;

						var bg = el.css('background-position').split(' ');

						var bgX = x + parseInt(bg[0]);
						var bgY = y + parseInt(bg[1]);

						el.css('background-position', bgX + 'px ' + bgY + 'px');

						obj.state.mouseX = e.clientX;
						obj.state.mouseY = e.clientY;
					}
				},
				imgMouseUp = function(e) {
					e.stopImmediatePropagation();
					obj.state.dragable = false;
				},
				zoomImage = function(e) {
					e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0 ? obj.ratio *= 1.1 : obj.ratio *= 0.9;
					setBackground();
			}

			obj.spinner.show();
			obj.image.onload = function() {
				obj.spinner.hide();
				setBackground();

				el.bind('mousedown', imgMouseDown);
				el.bind('mousemove', imgMouseMove);
				$(window).bind('mouseup', imgMouseUp);
				el.bind('mousewheel DOMMouseScroll', zoomImage);
			};
			obj.image.src = options.imgSrc;
			el.on('remove', function() {
				$(window).unbind('mouseup', imgMouseUp)
			});

			return obj;
		};

		jQuery.fn.cropbox = function(options) {
			return new cropbox(options, this);
		};
	}));
</script>
</html>
