<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
</head>
	<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
<body>
		<div class="top">
			<br />
			<a class="title">Stu Manage 。</a>
			<hr class="hr2"/>
		</div>
		
		<div class="center">
			<br /><br /><br />
			<div class="panel" id="stu">
				<br />			
				<p class="p1"><b>学生账号密码登录</b></p>
				<hr class="hr1"/>
				<input class="input1" placeholder="请输入用户名" name="userNo"/>
				<br /><br />
				<input class="input2" placeholder="请输入密码" name="userPwd"/>
				<br />
				<font color="red" style="margin-left: 18%;">${error}</font>
				<br />
				<input class="btn" type="submit" value="登录" align="center"/>
				<div class="switch">
					<a class="a2" href="#" id="switch1">管理员登录</a>
				</div>
			 </div>
			
			<div class="panel2" id="admin">
				<form action="${pageContext.request.contextPath}/admin/login" method="post">
				<br />			
				<p class="p1"><b>管理员账号密码登录</b></p>
				<hr class="hr1"/>
				<input class="input1" placeholder="请输入用户名" name="adminName"/>
				<br /><br />
				<input class="input2" placeholder="请输入密码" name="adminPwd"/>
				<br />
				<font color="red" style="margin-left: 18%;">${error}</font>
				<br />
				<input class="btn" type="submit" value="登录" align="center"/>
				<div class="switch">
					<a class="a2" href="#" id="switch2">学生账号登录</a>
				</div>
				</form>
			</div>
			
		</div>
		
		<div class="bottom">
			<p>Copyright © 2020 LiZhipeng.SSM All Rights Reserved.</p>
		</div>

</body>
<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
</html>
