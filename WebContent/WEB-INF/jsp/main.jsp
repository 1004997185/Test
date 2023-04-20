<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页面</title>
		<style>
			html,body{
				width: 100%;
				height: 100%;
				margin: 0;
				padding: 0;
			}
			.head{
				width: 100%;
				height: 15%;
				background-color: #01539B;
				float: left;
			}
			.left{
				width: 20%;
				height: 85%;
				background-color: #F1F8FD;
				float: left;
			}
			.title{
				font-size: 38px;
				font-weight: 600;
				color: white;
				padding-top: 15px;
				text-shadow:2px 1px 3px #B73860;
				padding-left: 6%;				
			}
			.first{
				width: 100%;
				height: 35px;
				text-align: center;
				font-size: 17px;
				background-color: #0F6ABA ;
				color: white;
				padding-top: 10px;
				border: 2px 1px 2px #FF8EB1;
			}
			.second{
				width: 100%;
				height: 35px;
				text-align: center;
				background-color: #C4E3FF;
				color: #008B8B;
				padding-top: 10px;
				border: 1px solid #5A5A5A;
			}
			.second:hover{
				color: white;
			}
			#iframe{
				width: 100%;
				height: 100%;
				padding: 0;
				margin: 0;
			}
			.right{
				width: 80%;
				height: 85%;
				background-color: #FFFFFF;
				float: left;
			}
			::-webkit-scrollbar{
				display:none;
			}
			.statu{
				color: white;
			}
			.logouttext{
				color: white;	
				text-decoration:none;
			}
		</style>
	</head>	
	<body>
		<div class="head">
			<br />
			<table width="100%">
				<tr>
					<td class="title">学生信息管理</td>
					<td align="right" class="statu">当前用户：${admin.adminName}</td>
					<td align="right">&nbsp;&nbsp;</td>
					<td id="loginout"><a class="logouttext" href="#">退出</a><td>
				</tr>
			</table>
		</div>
		<div class="left" id="left">
			<div class="item">
				<div class="first">功能管理</div>
				<div class="second" id="#">学生管理</div>
				<div class="second" id="#">班级管理</div>
			</div>
		</div>
		<div class="right">
        <iframe id="iframe" src="../user/allUser"></iframe>	
		</div>
	</body>
</html>