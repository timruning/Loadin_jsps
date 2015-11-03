<%@page contentType="text/html; charset=GB2312"%>
<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		
		<title>
			注册页面
		</title>
	</head>
	<body>
		<center>
		<h1>SF的第一次尝试登录页面</h1>
		<hr>
		<br>
		<br>
		
		<%
			if(request.getAttribute("error1")!=null)
			{
				%>
				<%=request.getAttribute("error1")%>
				<%
			}
		%>
		<form action="sign_conf.jsp" method="post">
			<table>
				<tr>
					<td>用户名 :</td>
					<td><input type="text" name="name1"></td>
				</tr>
				<tr>
					<td>邮&nbsp;箱 :</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>密&nbsp;码 :</td>
					<td><input type="password" name="password1"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="注册">
						<input type="reset" value="重置">
						<a href="login.jsp">重新登陆</a>
					</td>
				</tr>
			</table>
		</form>
		</center>
	</body>
</html>