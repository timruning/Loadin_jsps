<%@page contentType="text/html; charset=GB2312"%>

<%
request.setCharacterEncoding ("GB2312");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			ҳ���½
		</title>
	</head>
	<body>
		<center>
		<h1>SF�ĵ�һ�γ��Ե�¼ҳ��</h1>
		<hr>
		<br>
		<br>
		<%
		
		%>
		<%
			if(request.getAttribute("err")!=null)
			{
				%>
				<%=request.getAttribute("err")%>
				<%
			}
		%>
		<form action="login_conf.jsp" method="post">
			<table>
				<tr>
					<td>�û��� :</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>��&nbsp;�� :</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="��½">
					<input type="reset" value="����">
					<a href="signin.jsp">ע��</a></td>
				</tr>
			</table>
		</form>
		</center>
	</body>
</html>