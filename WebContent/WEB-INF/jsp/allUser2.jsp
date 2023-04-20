<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>学生信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>	
    <script type="text/javascript" src="../js/jquery.pagination.js"></script>	
    <!-- Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="../css/pagination.css"/>
    <style type="text/css">
			.dialog{
				width:380px;
				height:420px;
				background-color:white;
				border: 1px solid #888888;
				position: absolute;
				top: 100px;
				left: 400px;
				display: none;
			}    
			.note{
				margin:10%;
			}
			.hidden{
				display: none;
			}
			.field{
				width: 130px;
				height: 25px;
			}
			.font{
				font-size:15px;
			}
    </style>
</head>
<body>
<br>
<div class="container">
	
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>学生信息列表</small>
                </h1>
            </div>
        </div>
    </div>
<div class="row col-md-12 column">
	<form  name="userForm" id="userForm" action="${pageContext.request.contextPath}/user/searchUser2" method="post">
	<span class="font">学号：</span>
	<input id="searchNo" name="userNo" class="field" type="text" placeholder="请输入学号" value="${user.userNo}"/>&nbsp;&nbsp;
	<span class="font">姓名：</span>
	<input id="searchName" name="userName" class="field" type="text" placeholder="请输入姓名" value="${user.userName}"/>&nbsp;&nbsp;
    <span class="font">性别：</span>
    <input id="searchSex" name="userSex" class="field" type="text" placeholder="请输入性别" value="${user.userSex}"/>&nbsp;&nbsp;
    <span class="font">班级：</span>
    <input id="searchGrade" name="gradeName" class="field" type="text" placeholder="请输入班级" value="${user.gradeName}"/>&nbsp;&nbsp;
    
    <input type="hidden" name="page" id="page" value=""/>
    
    <button type="submit" class="btn btn-primary">搜索</button>&nbsp;
    <a class="btn btn-primary" id="addBtn">新增</a>
	</form>
</div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" id="tb">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>班级</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody id="tb">
                <c:forEach var="user" items="${page.list}">
                    <tr>
                    	<td class="hidden">${user.getUserId()}</td>
                        <td>${user.getUserNo()}</td>
                        <td>${user.getUserName()}</td>
                        <td>${user.getUserSex()}</td>
                        <td>${user.getGradeName()}</td>
                        <td>
                            <a id="updataBtn">更改</a> |
                            <a href="${pageContext.request.contextPath}/user/del/${user.getUserId()}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-6" style="margin-left:38%">当前${page.pageNum}页,总${page.pages}页,总${page.total}条记录</div>
        </div>
    </div>
    <div class="box">
		<div id="pagination" class="page center">
	</div>
    <nav aria-label="Page navigation" style="margin-left:34%">
			<ul class="pagination">
					<li><a href="javascript:to_page(1)">首页</a></li>
					<c:if test="${page.hasPreviousPage }">
						<li><a href="javascript:to_page(${page.pageNum-1})"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${page.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == page.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != page.pageNum }">
							<li><a href="javascript:to_page(${page_Num})">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${page.hasNextPage }">
						<li><a href="javascript:to_page(${page.pageNum+1})"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="javascript:to_page(${page.pages})">末页</a></li>
			</ul>
	</nav>

</div>  

	<div class="dialog" id="adddialog">
		<div class="page-header note">
			<h1>
				 <small>新增学生信息</small>
			</h1>
		</div>
	    <form action="${pageContext.request.contextPath}/user/addUser" method="post" class="note">
	        学号：<input type="text" name="userNo"><br><br>
	        姓名：<input type="text" name="userName"><br><br>
	        性别：<input type="text" name="userSex"><br><br>
	        专业：<input type="text" name="gradeName"><br><br>
	        <input type="submit" class="btn btn-success col-md-3 column" style="margin-left:14%;" value="添加">
	        <input id="addcancel" class="btn btn-info col-md-3 column" style="margin-left:4%;" value="取消">
	    </form>    
	</div>    
	
	<div class="dialog" id="dialog">
		<div class="page-header note">
			<h1>
				 <small>更改学生信息</small>
			</h1>
		</div>
	    <form action="${pageContext.request.contextPath}/user/updateUser" method="post" class="note">
	    <input type="hidden" name="userId"  id="userId"/>
	        学号：<input type="text" name="userNo" id="userNo"><br><br>
	        姓名：<input type="text" name="userName" id="userName"><br><br>
	        性别：<input type="text" name="userSex" id="userSex"><br><br>
	        专业：<input type="text" name="gradeName" id="gradeName"><br><br>
	        <input type="submit" class="btn btn-success col-md-3 column" style="margin-left:14%;" value="更改">
	        <input id="updatacancel" class="btn btn-info col-md-3 column" style="margin-left:4%;" value="取消">
	    </form>    
	</div>    
</div>
</body>
<script type="text/javascript">
		//添加
		var addBtn = document.getElementById("addBtn");
		addBtn.onclick = function(){
			var adddialog = document.getElementById("adddialog");
			adddialog.style.display = "block";
		}
		//添加-取消
		var addcancel = document.getElementById("addcancel");
		addcancel.onclick = function(){
			var adddialog = document.getElementById("adddialog");
			adddialog.style.display = "none";
		}

		//更改-取消
		var updatacancel = document.getElementById("updatacancel");
		updatacancel.onclick = function(){
			var dialog = document.getElementById("dialog");
			dialog.style.display = "none";
		}
		//更改---利用父元素绑定子元素监听
		var tb = document.getElementById("tb");
		tb.onclick = function(event){
			var tagt =  event.target;
			if(tagt.innerText =="更改"){
				var dialog = document.getElementById("dialog");
				dialog.style.display = "block";
				
				tdArr =  tagt.parentElement.parentElement.children; //设置成全局变量
				var Id = tdArr[0].innerHTML;
				var No = tdArr[1].innerHTML;
				var Name = tdArr[2].innerHTML;
				var Sex = tdArr[3].innerHTML;
				var Grade = tdArr[4].innerHTML;
				
				var userId = document.getElementById("userId");
				var userNo = document.getElementById("userNo");
				var userName = document.getElementById("userName");
				var userSex = document.getElementById("userSex");
				var gradeName = document.getElementById("gradeName");
				
				userId.value= Id;
				userNo.value= No;
				userName.value= Name;
				userSex.value= Sex;
				gradeName.value= Grade;
			}
		}
		
		// 提交分页的查询的表单
		function to_page(page) {
			var searchNo = document.getElementById("searchNo").value;
			var searchName = document.getElementById("searchName").value;
			var searchSex = document.getElementById("searchSex").value;
			var searchGrade = document.getElementById("searchGrade").value;
			if (page) {
				$("#page").val(page);
				$("#userNo").val(searchNo);
				$("#userName").val(searchName);
				$("#userSex").val(searchSex);
				$("#gradeName").val(searchGrade);
			}
			document.userForm.submit();
		}
		
</script>
</html>