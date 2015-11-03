<%@page contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			页面登陆
		</title>
	</head>
	<body>
		<center>
		<h1>SF的第一次尝试登录页面</h1>
		<hr>
		<br>
		<br>
		<%
		
		if(session.getAttribute("uname")!=null)
		{
		
			String title=request.getParameter("title");
			session.setAttribute("title1",title);
		%>
			<h1><%="欢迎光临  "+session.getAttribute("uname")+"!"%></h1><br>
			<form action="edit_do.jsp" method="post">
				<table>
				<tr>
					<td>标题 :<input type="text" name="title"></td>
				</tr>
				<tr>
					<td><textarea name="content" cols="120" rows="15"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="评论">
						<input type="reset" value="清空">
					</td>
					
				</tr>
				</table>
			
			</form>
			<%
		}
	else
		{
				response.setHeader("refresh","5;URL=login.jsp");
			%>
			你还没有登陆，5秒后自动跳转到登录页面<br>
			如果没有跳转，请点击
			<a href="login.jsp">登陆</a><br>
			或者点击<a href="signin.jsp">注册</a>新的账号<br>
			<%
		}
		%>
		
		</center>
	</body>
</html>